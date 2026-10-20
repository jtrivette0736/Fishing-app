#!/usr/bin/env bash
# SQL test harness (ADR 0004). Applies the Supabase stubs, every migration and the test helpers to
# a fresh database, then runs each supabase/tests/*.sql file in its own rolled-back transaction.
#
# Usage
#   bash supabase/tests/run.sh            fresh cluster -> migrate -> run tests -> stop
#   bash supabase/tests/run.sh --keep     fresh cluster -> migrate, leave it running (db:types)
#   bash supabase/tests/run.sh --stop     stop a cluster left running by --keep
#   DATABASE_URL=postgresql://... bash supabase/tests/run.sh
#                                         use an existing server instead (CI service container);
#                                         a database named $HARNESS_DB is (re)created on it
#
# Local mode needs PostgreSQL 16 binaries and a `postgres` OS user (initdb refuses to run as
# root). The cluster lives under /tmp/fishing-pg on port 54329 with a Unix socket in the same
# directory and trust auth; it is recreated from scratch on every run. Nothing here is a secret.
set -euo pipefail

PG_BIN="${PG_BIN:-/usr/lib/postgresql/16/bin}"
HARNESS_PORT="${HARNESS_PORT:-54329}"
HARNESS_DB="${HARNESS_DB:-fishing_test}"
# Literal paths on purpose: nothing below ever deletes a path built from a variable.
HARNESS_HOME=/tmp/fishing-pg
HARNESS_DATA=/tmp/fishing-pg/data
HARNESS_LOG=/tmp/fishing-pg/postgres.log

SUPABASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TESTS_DIR="$SUPABASE_DIR/tests"
MIGRATIONS_DIR="$SUPABASE_DIR/migrations"

mode="${1:-run}"
case "$mode" in
  run | --run) mode=run ;;
  --keep) mode=keep ;;
  --stop) mode=stop ;;
  -h | --help)
    sed -n '2,16p' "${BASH_SOURCE[0]}"
    exit 0
    ;;
  *)
    echo "run.sh: unknown option '$mode' (try --help)" >&2
    exit 2
    ;;
esac

say() { printf '\033[1;36m[sql]\033[0m %s\n' "$*"; }
die() {
  printf '\033[1;31m[sql] %s\033[0m\n' "$*" >&2
  exit 1
}

# Run a command as the postgres OS user, whoever we are.
as_postgres() {
  if [[ "$(id -un)" == "postgres" ]]; then
    bash -c "$1"
  elif [[ "$(id -u)" == "0" ]]; then
    su postgres -s /bin/bash -c "$1"
  else
    sudo -u postgres bash -c "$1"
  fi
}
as_root() {
  if [[ "$(id -u)" == "0" ]]; then bash -c "$1"; else sudo bash -c "$1"; fi
}

cluster_running() {
  as_postgres "'$PG_BIN/pg_ctl' -D '$HARNESS_DATA' status" > /dev/null 2>&1
}

stop_cluster() {
  if cluster_running; then
    as_postgres "'$PG_BIN/pg_ctl' -D '$HARNESS_DATA' -m fast -w stop" > /dev/null
    say "cluster stopped"
  fi
}

start_fresh_cluster() {
  [[ -x "$PG_BIN/initdb" ]] || die "PostgreSQL binaries not found at $PG_BIN (set PG_BIN)"
  id postgres > /dev/null 2>&1 || die "no 'postgres' OS user; set DATABASE_URL to use a server instead"
  stop_cluster
  as_root "mkdir -p /tmp/fishing-pg && rm -rf /tmp/fishing-pg/data && chown postgres /tmp/fishing-pg"
  say "initdb -> $HARNESS_DATA"
  as_postgres "'$PG_BIN/initdb' -D '$HARNESS_DATA' -U postgres --auth=trust -E UTF8 --locale=C" > /dev/null
  say "starting postgres on 127.0.0.1:$HARNESS_PORT"
  as_postgres "'$PG_BIN/pg_ctl' -D '$HARNESS_DATA' -l '$HARNESS_LOG' -w \
    -o \"-p $HARNESS_PORT -k $HARNESS_HOME -c listen_addresses=127.0.0.1 -c fsync=off -c synchronous_commit=off -c full_page_writes=off\" \
    start" > /dev/null
}

if [[ "$mode" == "stop" ]]; then
  stop_cluster
  exit 0
fi

# Where to connect ---------------------------------------------------------------------------
if [[ -n "${DATABASE_URL:-}" ]]; then
  ADMIN_URL="$DATABASE_URL"
  say "using DATABASE_URL (no local cluster)"
else
  start_fresh_cluster
  ADMIN_URL="postgresql://postgres@127.0.0.1:$HARNESS_PORT/postgres"
  if [[ "$mode" == "run" ]]; then
    trap 'stop_cluster' EXIT
  fi
fi

PSQL=(psql -X -q -v ON_ERROR_STOP=1 -P pager=off)
command -v psql > /dev/null || PSQL=("$PG_BIN/psql" -X -q -v ON_ERROR_STOP=1 -P pager=off)

# Wait for the server (service containers may still be starting).
for _ in $(seq 1 30); do
  if "${PSQL[@]}" "$ADMIN_URL" -c 'select 1' > /dev/null 2>&1; then break; fi
  sleep 1
done
"${PSQL[@]}" "$ADMIN_URL" -c 'select 1' > /dev/null 2>&1 || die "cannot connect to $ADMIN_URL"

# Fresh database -----------------------------------------------------------------------------
"${PSQL[@]}" "$ADMIN_URL" -c "drop database if exists $HARNESS_DB" -c "create database $HARNESS_DB"
DB_URL="${ADMIN_URL%/*}/$HARNESS_DB"

say "stubs"
"${PSQL[@]}" "$DB_URL" -f "$TESTS_DIR/supabase_stubs.sql"

say "migrations"
shopt -s nullglob
migrations=("$MIGRATIONS_DIR"/*.sql)
[[ ${#migrations[@]} -gt 0 ]] || die "no migrations in $MIGRATIONS_DIR"
for m in "${migrations[@]}"; do
  say "  $(basename "$m")"
  "${PSQL[@]}" "$DB_URL" -f "$m"
done

say "test helpers"
"${PSQL[@]}" "$DB_URL" -f "$TESTS_DIR/lib/test_helpers.sql"

if [[ "$mode" == "keep" ]]; then
  say "ready: $DB_URL (stop with: bash supabase/tests/run.sh --stop)"
  exit 0
fi

# Tests --------------------------------------------------------------------------------------
tests=()
for t in "$TESTS_DIR"/*.sql; do
  [[ "$(basename "$t")" == "supabase_stubs.sql" ]] && continue
  tests+=("$t")
done
[[ ${#tests[@]} -gt 0 ]] || die "no test files in $TESTS_DIR"

failed=0
passed=0
for t in "${tests[@]}"; do
  name="$(basename "$t")"
  say "test $name"
  # Each file runs in one transaction that is always rolled back: fixtures never leak between files.
  # `set -o pipefail` makes the pipeline fail when psql does, even though sed succeeds.
  # -o /dev/null drops result tuples; \echo lines, NOTICE "ok:" lines and errors still show.
  if "${PSQL[@]}" -o /dev/null "$DB_URL" -c 'begin' -f "$t" -c 'rollback' 2>&1 | sed 's/^/      /'; then
    passed=$((passed + 1))
  else
    failed=$((failed + 1))
    printf '\033[1;31m[sql] FAILED %s\033[0m\n' "$name" >&2
  fi
done

if [[ "$failed" -gt 0 ]]; then
  die "SQL tests: $passed passed, $failed failed"
fi
say "SQL tests: $passed file(s) passed, 0 failed"
