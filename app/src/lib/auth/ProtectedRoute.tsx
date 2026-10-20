import { Navigate, Outlet, useLocation } from 'react-router-dom'

import { Spinner } from '@/components/Spinner'

import { useAuth } from './context'

/**
 * Wraps routes that need a signed-in user. While the session is being read it shows a spinner;
 * signed out, it sends the person to /login remembering where they were going. Demo mode has
 * a signed-in demo user, so it passes straight through.
 */
export function ProtectedRoute() {
  const auth = useAuth()
  const location = useLocation()

  if (auth.status === 'loading') {
    return (
      <div className="flex min-h-[50vh] items-center justify-center">
        <Spinner size="lg" label="Checking your session" />
      </div>
    )
  }

  if (auth.status === 'signed_out') {
    const from = `${location.pathname}${location.search}`
    return <Navigate to="/login" replace state={{ from }} />
  }

  return <Outlet />
}
