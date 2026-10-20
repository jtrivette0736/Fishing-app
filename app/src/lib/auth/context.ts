import { createContext, useContext } from 'react'

import type { Result } from '@/lib/api/result'

import type { AuthUser } from './service'

export type AuthStatus = 'loading' | 'signed_out' | 'signed_in'

export interface AuthContextValue {
  readonly status: AuthStatus
  readonly user: AuthUser | null
  readonly mode: 'supabase' | 'demo'
  signInWithMagicLink(email: string): Promise<Result<void>>
  signInWithPassword(email: string, password: string): Promise<Result<void>>
  signOut(): Promise<Result<void>>
}

export const AuthContext = createContext<AuthContextValue | null>(null)

export function useAuth(): AuthContextValue {
  const value = useContext(AuthContext)
  if (value === null) {
    throw new Error('useAuth() needs an <AuthProvider> above it (see src/app/providers.tsx).')
  }
  return value
}
