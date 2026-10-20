import { fromAuthError, fromUnknown } from '@/lib/api/errors'
import { err, ok, type Result } from '@/lib/api/result'
import { env, isDemo } from '@/lib/env'
import { getSupabaseClient, type TypedSupabaseClient } from '@/lib/supabase/client'

export interface AuthUser {
  readonly id: string
  readonly email: string | null
}

/**
 * Everything the app needs from an identity provider, behind one small interface so screens
 * and tests never touch Supabase Auth directly. Two implementations: Supabase, and an in-memory
 * demo that starts signed in.
 */
export interface AuthService {
  readonly mode: 'supabase' | 'demo'
  /** The current user, if a session exists. */
  getUser(): Promise<AuthUser | null>
  /** Called on every sign-in/sign-out/refresh. Returns an unsubscribe function. */
  onChange(listener: (user: AuthUser | null) => void): () => void
  /** Emails a one-time sign-in link that lands on /auth/callback. */
  signInWithMagicLink(email: string): Promise<Result<void>>
  signInWithPassword(email: string, password: string): Promise<Result<void>>
  signOut(): Promise<Result<void>>
}

function toAuthUser(user: { id: string; email?: string | undefined } | null | undefined): AuthUser | null {
  if (!user) return null
  return { id: user.id, email: user.email ?? null }
}

export function createSupabaseAuthService(
  client: TypedSupabaseClient,
  appUrl: string,
): AuthService {
  const callbackUrl = new URL('/auth/callback', appUrl).toString()
  return {
    mode: 'supabase',

    async getUser() {
      const { data } = await client.auth.getSession()
      return toAuthUser(data.session?.user)
    },

    onChange(listener) {
      const { data } = client.auth.onAuthStateChange((_event, session) => {
        listener(toAuthUser(session?.user))
      })
      return () => {
        data.subscription.unsubscribe()
      }
    },

    async signInWithMagicLink(email) {
      try {
        const { error } = await client.auth.signInWithOtp({
          email,
          options: { emailRedirectTo: callbackUrl, shouldCreateUser: true },
        })
        return error ? err(fromAuthError(error)) : ok(undefined)
      } catch (thrown) {
        return err(fromUnknown(thrown))
      }
    },

    async signInWithPassword(email, password) {
      try {
        const { error } = await client.auth.signInWithPassword({ email, password })
        return error ? err(fromAuthError(error)) : ok(undefined)
      } catch (thrown) {
        return err(fromUnknown(thrown))
      }
    },

    async signOut() {
      try {
        const { error } = await client.auth.signOut()
        return error ? err(fromAuthError(error)) : ok(undefined)
      } catch (thrown) {
        return err(fromUnknown(thrown))
      }
    },
  }
}

export const DEMO_USER: AuthUser = {
  id: '00000000-0000-4000-8000-000000000001',
  email: 'demo@example.com',
}

/**
 * In-memory auth for demo mode and tests. Starts with `initialUser` (the demo user by default)
 * so protected screens open straight away; any sign-in succeeds and signs in as that email.
 */
export function createDemoAuthService(initialUser: AuthUser | null = DEMO_USER): AuthService {
  let current = initialUser
  const listeners = new Set<(user: AuthUser | null) => void>()
  const set = (user: AuthUser | null) => {
    current = user
    for (const listener of listeners) listener(user)
  }
  return {
    mode: 'demo',
    getUser: () => Promise.resolve(current),
    onChange(listener) {
      listeners.add(listener)
      return () => {
        listeners.delete(listener)
      }
    },
    signInWithMagicLink(email) {
      set({ id: DEMO_USER.id, email })
      return Promise.resolve(ok(undefined))
    },
    signInWithPassword(email) {
      set({ id: DEMO_USER.id, email })
      return Promise.resolve(ok(undefined))
    },
    signOut() {
      set(null)
      return Promise.resolve(ok(undefined))
    },
  }
}

/** The AuthService for this build: demo when Supabase isn't configured. */
export function createAppAuthService(): AuthService {
  return isDemo
    ? createDemoAuthService()
    : createSupabaseAuthService(getSupabaseClient(), env.VITE_APP_URL)
}
