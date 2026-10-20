import type { TypedSupabaseClient } from '@/lib/supabase/client'

import { run } from './postgrest'
import { mapResult, ok, type Result } from './result'

export interface HealthStatus {
  readonly mode: 'supabase' | 'demo'
  /** ISO timestamp of the check. */
  readonly checkedAt: string
}

export interface HealthApi {
  /**
   * A signed-in round trip: browser -> PostgREST (with the user's JWT) -> Postgres and back.
   * Calls `gen_token`, which anonymous visitors may not run, so it also proves the grants.
   */
  check(): Promise<Result<HealthStatus>>
}

export function createHealthApi(client: TypedSupabaseClient): HealthApi {
  return {
    async check() {
      const result = await run(client.rpc('gen_token', { bytes: 8 }))
      return mapResult(result, () => ({ mode: 'supabase', checkedAt: new Date().toISOString() }))
    },
  }
}

export function createDemoHealthApi(delayMs = 300): HealthApi {
  return {
    async check() {
      await new Promise((resolve) => setTimeout(resolve, delayMs))
      return ok({ mode: 'demo', checkedAt: new Date().toISOString() })
    },
  }
}
