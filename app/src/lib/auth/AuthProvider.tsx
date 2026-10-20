import { type ReactNode, useEffect, useMemo, useState } from 'react'

import { AuthContext, type AuthContextValue, type AuthStatus } from './context'
import type { AuthService, AuthUser } from './service'

interface AuthState {
  readonly status: AuthStatus
  readonly user: AuthUser | null
}

export function AuthProvider({ service, children }: { service: AuthService; children: ReactNode }) {
  const [state, setState] = useState<AuthState>({ status: 'loading', user: null })

  useEffect(() => {
    let active = true
    const apply = (user: AuthUser | null) => {
      if (active) setState({ status: user ? 'signed_in' : 'signed_out', user })
    }
    const unsubscribe = service.onChange(apply)
    void service.getUser().then(apply, () => {
      apply(null)
    })
    return () => {
      active = false
      unsubscribe()
    }
  }, [service])

  const value = useMemo<AuthContextValue>(
    () => ({
      status: state.status,
      user: state.user,
      mode: service.mode,
      signInWithMagicLink: (email) => service.signInWithMagicLink(email),
      signInWithPassword: (email, password) => service.signInWithPassword(email, password),
      signOut: () => service.signOut(),
    }),
    [service, state],
  )

  return <AuthContext value={value}>{children}</AuthContext>
}
