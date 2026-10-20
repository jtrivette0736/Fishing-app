import { createClient, type SupabaseClient } from '@supabase/supabase-js'

import { env } from '@/lib/env'

import type { Database } from './types'

/**
 * The typed Supabase client. Only `src/lib/api` and `src/lib/auth` may import this module
 * (enforced by ESLint `no-restricted-imports`); screens go through `useApi()` and `useAuth()`.
 */
export type TypedSupabaseClient = SupabaseClient<Database>

export function createSupabaseClient(url: string, anonKey: string): TypedSupabaseClient {
  return createClient<Database>(url, anonKey, {
    auth: {
      flowType: 'pkce',
      persistSession: true,
      autoRefreshToken: true,
      detectSessionInUrl: true,
    },
  })
}

let instance: TypedSupabaseClient | undefined

/**
 * The app's single client, created on first use. Throws in demo mode: check `isDemo` first
 * (the factories in `src/lib/api` and `src/lib/auth` do).
 */
export function getSupabaseClient(): TypedSupabaseClient {
  if (env.VITE_SUPABASE_URL === undefined || env.VITE_SUPABASE_ANON_KEY === undefined) {
    throw new Error(
      'Supabase is not configured, so the app is in demo mode. Check `isDemo` before asking for the client.',
    )
  }
  instance ??= createSupabaseClient(env.VITE_SUPABASE_URL, env.VITE_SUPABASE_ANON_KEY)
  return instance
}
