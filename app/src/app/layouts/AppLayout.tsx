import { useState } from 'react'
import { Link, NavLink, Outlet } from 'react-router-dom'

import { Badge, Button } from '@/components'
import { useAuth } from '@/lib/auth'

/** The signed-in workspace: top bar with navigation, who is signed in, and sign out. */
export function AppLayout() {
  const auth = useAuth()
  const [signingOut, setSigningOut] = useState(false)
  const [signOutError, setSignOutError] = useState<string | null>(null)

  const signOut = async () => {
    setSigningOut(true)
    setSignOutError(null)
    const result = await auth.signOut()
    setSigningOut(false)
    if (!result.ok) setSignOutError(result.error.message)
  }

  return (
    <div className="flex min-h-dvh flex-col">
      <header className="border-b border-slate-200 bg-white">
        <div className="mx-auto flex max-w-5xl flex-wrap items-center gap-x-6 gap-y-2 px-4 py-3">
          <Link to="/app" className="text-lg font-semibold text-brand-800">
            Reel Service Tracker
          </Link>
          <nav aria-label="Main" className="flex items-center gap-1 text-sm">
            <NavLink
              to="/app"
              end
              className={({ isActive }) =>
                `rounded-md px-3 py-2 ${isActive ? 'bg-brand-50 text-brand-900' : 'text-slate-700 hover:bg-slate-100'}`
              }
            >
              Home
            </NavLink>
          </nav>
          <div className="ml-auto flex items-center gap-3 text-sm">
            {auth.mode === 'demo' && <Badge tone="warning">Demo mode</Badge>}
            <span className="hidden text-slate-600 sm:inline">{auth.user?.email ?? 'Signed in'}</span>
            <Button variant="ghost" size="sm" onClick={signOut} loading={signingOut}>
              Sign out
            </Button>
          </div>
        </div>
        {signOutError && (
          <p role="alert" className="bg-red-50 px-4 py-2 text-center text-sm text-red-800">
            {signOutError}
          </p>
        )}
      </header>
      <main id="main" className="mx-auto w-full max-w-5xl flex-1 px-4 py-6">
        <Outlet />
      </main>
    </div>
  )
}
