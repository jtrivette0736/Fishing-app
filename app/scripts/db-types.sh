#!/usr/bin/env bash
# Regenerates src/lib/supabase/types.ts from the migrations, using the local Postgres harness
# (or DATABASE_URL when set). Deterministic: running it twice yields the same file.
#
#   npm run db:types
set -euo pipefail

APP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT="$APP_DIR/src/lib/supabase/types.ts"
TMP="$(mktemp)"
trap 'rm -f "$TMP"' EXIT

HARNESS_PORT="${HARNESS_PORT:-54329}"
HARNESS_DB="${HARNESS_DB:-fishing_test}"

# Fresh database with every migration applied, left running until we are done.
bash "$APP_DIR/supabase/tests/run.sh" --keep
if [[ -n "${DATABASE_URL:-}" ]]; then
  DB_URL="${DATABASE_URL%/*}/$HARNESS_DB"
else
  trap 'rm -f "$TMP"; bash "$APP_DIR/supabase/tests/run.sh" --stop' EXIT
  DB_URL="postgresql://postgres@127.0.0.1:$HARNESS_PORT/$HARNESS_DB"
fi

# The harness speaks plaintext; the CLI tries TLS first unless told not to.
case "$DB_URL" in
  *\?*) GEN_URL="$DB_URL&sslmode=disable" ;;
  *) GEN_URL="$DB_URL?sslmode=disable" ;;
esac

echo "[types] supabase gen types <- $DB_URL"
# Supabase CLI 2.x; pinned to the major so a new major cannot change the output shape silently.
npx --yes supabase@2 gen types typescript --db-url "$GEN_URL" --schema public > "$TMP"

{
  cat <<'EOF'
// GENERATED FILE. Do not edit by hand.
//
// Regenerate after every migration with:   npm run db:types
// (applies supabase/migrations to the local Postgres harness, then runs
//  `supabase gen types typescript --db-url ... --schema public` and formats the result).
//
// The `Database` type is the only source of table, view and function shapes for the typed
// Supabase client (src/lib/supabase/client.ts) and the data layer (src/lib/api).
EOF
  cat "$TMP"
} > "$OUT"

(cd "$APP_DIR" && npx prettier --log-level warn --write "$OUT")
echo "[types] wrote ${OUT#"$APP_DIR"/}"
