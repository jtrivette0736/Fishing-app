import { Link } from 'react-router-dom'

import { useAuth } from '@/lib/auth'

export function Landing() {
  const auth = useAuth()
  const signedIn = auth.status === 'signed_in'

  return (
    <main id="main" className="mx-auto max-w-3xl px-4 py-16 md:py-24">
      <p className="text-sm font-medium tracking-wide text-brand-700 uppercase">
        For reel techs and rod builders
      </p>
      <h1 className="mt-3 text-4xl font-semibold tracking-tight text-slate-900 md:text-5xl">
        Every job tracked, every customer kept in the loop.
      </h1>
      <p className="mt-4 max-w-2xl text-lg text-slate-600">
        A public intake page for your shop, a status page for each customer, and payments that land
        in your own account. Pay per job, never for an empty month.
      </p>
      <div className="mt-8 flex flex-wrap gap-3">
        <Link
          to={signedIn ? '/app' : '/login'}
          className="inline-flex items-center rounded-md bg-brand-700 px-5 py-2.5 font-medium text-white hover:bg-brand-800"
        >
          {signedIn ? 'Open your workspace' : 'Sign in'}
        </Link>
        <Link
          to="/s/demo"
          className="inline-flex items-center rounded-md border border-slate-300 bg-white px-5 py-2.5 font-medium text-slate-900 hover:bg-slate-50"
        >
          See a shop page
        </Link>
      </div>
    </main>
  )
}
