import { useEffect, useState } from 'react'
import { Link, Navigate, useSearchParams } from 'react-router-dom'
import { z } from 'zod'

import { ErrorState, Spinner } from '@/components'
import { useAuth } from '@/lib/auth'

/** GoTrue puts failures in the query string; success is a `code` the client exchanges itself. */
const callbackParams = z.object({
  error: z.string().optional(),
  error_code: z.string().optional(),
  error_description: z.string().optional(),
})

const WAIT_MS = 8_000

/**
 * Where the magic link lands. The Supabase client exchanges the PKCE code on load and fires an
 * auth change; this page waits for the session, then goes to the workspace. If nothing arrives
 * within a few seconds (link already used, opened in another browser) it explains what to do.
 */
export function AuthCallback() {
  const auth = useAuth()
  const [searchParams] = useSearchParams()
  const [timedOut, setTimedOut] = useState(false)

  const params = callbackParams.safeParse(Object.fromEntries(searchParams))
  const providerError = params.success
    ? (params.data.error_description ?? params.data.error_code ?? params.data.error)
    : undefined

  useEffect(() => {
    const timer = setTimeout(() => {
      setTimedOut(true)
    }, WAIT_MS)
    return () => {
      clearTimeout(timer)
    }
  }, [])

  if (auth.status === 'signed_in') return <Navigate to="/app" replace />

  const tryAgain = (
    <Link to="/login" className="text-sm font-medium text-brand-800 underline">
      Request a new link
    </Link>
  )

  if (providerError !== undefined) {
    return (
      <main id="main" className="mx-auto max-w-md px-4 py-16">
        <ErrorState
          title="That link didn't work"
          message={describeProviderError(providerError)}
          action={tryAgain}
        />
      </main>
    )
  }

  if (timedOut) {
    return (
      <main id="main" className="mx-auto max-w-md px-4 py-16">
        <ErrorState
          title="Still not signed in"
          message="Sign-in links work once and must be opened in the same browser that asked for them. Request a new one and open it here."
          action={tryAgain}
        />
      </main>
    )
  }

  return (
    <main id="main" className="flex min-h-[60vh] items-center justify-center px-4">
      <Spinner size="lg" label="Finishing sign-in" />
    </main>
  )
}

function describeProviderError(raw: string): string {
  const text = raw.replace(/\+/g, ' ')
  if (/expired/i.test(text)) return 'This sign-in link has expired. Request a new one.'
  if (/invalid|already/i.test(text)) return 'This sign-in link was already used or is no longer valid.'
  return `Sign-in failed: ${text}`
}
