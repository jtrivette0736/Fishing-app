import { getSupabaseClient, type TypedSupabaseClient } from '@/lib/supabase/client'
import { isDemo } from '@/lib/env'

import { createDemoHealthApi, createHealthApi, type HealthApi } from './health'

/**
 * The data layer. Screens call `useApi()` and get this object; they never see the Supabase
 * client. Each feature contributes one slice built by a `create<Feature>Api(client)` function
 * in `src/features/<feature>/api/`, and the same slice has a demo twin backed by memory.
 *
 * Phase 5b adds, for example:
 *   shops: createShopApi(client)
 *   jobs: createJobApi(client)
 */
export interface Api {
  readonly mode: 'supabase' | 'demo'
  readonly health: HealthApi
}

export function createApi(client: TypedSupabaseClient): Api {
  return {
    mode: 'supabase',
    health: createHealthApi(client),
  }
}

export function createDemoApi(): Api {
  return {
    mode: 'demo',
    health: createDemoHealthApi(),
  }
}

/** The Api for this build: demo when Supabase isn't configured, otherwise the real one. */
export function createAppApi(): Api {
  return isDemo ? createDemoApi() : createApi(getSupabaseClient())
}

export { ApiProvider } from './ApiProvider'
export { useApi } from './context'
export { run } from './postgrest'
export {
  type ApiError,
  type ApiErrorCode,
  ApiRequestError,
  apiError,
  DEFAULT_MESSAGES,
  err,
  isApiError,
  mapResult,
  ok,
  type Result,
  toApiError,
  unwrap,
} from './result'
export type { HealthStatus } from './health'
