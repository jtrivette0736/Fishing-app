import { Link, Outlet } from 'react-router-dom'

/**
 * Pages a shop's customers open without an account (intake page, status page). Minimal chrome,
 * the shop's own name comes from the page, and the "powered by" link is the product's one
 * built-in distribution loop (validation gate C7).
 */
export function PublicLayout() {
  return (
    <div className="flex min-h-dvh flex-col">
      <main id="main" className="mx-auto w-full max-w-2xl flex-1 px-4 py-8">
        <Outlet />
      </main>
      <footer className="border-t border-slate-200 py-4 text-center text-sm text-slate-500">
        Powered by{' '}
        <Link to="/" className="font-medium text-brand-800 underline-offset-2 hover:underline">
          Reel Service Tracker
        </Link>
      </footer>
    </div>
  )
}
