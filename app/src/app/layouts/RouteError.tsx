import { isRouteErrorResponse, Link, useRouteError } from 'react-router-dom'

import { Button, ErrorState } from '@/components'

/** Catches anything a route throws (render errors, loader errors) and keeps the app usable. */
export function RouteError() {
  const error = useRouteError()

  if (isRouteErrorResponse(error) && error.status === 404) {
    return (
      <main id="main" className="mx-auto max-w-xl px-4 py-16">
        <ErrorState
          title="Page not found"
          message="That address doesn't exist. Check the link, or go back to the start."
          action={
            <Link to="/" className="text-sm font-medium text-brand-800 underline">
              Go home
            </Link>
          }
        />
      </main>
    )
  }

  return (
    <main id="main" className="mx-auto max-w-xl px-4 py-16">
      <ErrorState
        message="Something broke on this page. Reloading usually fixes it; if not, tell us what you were doing."
        action={
          <>
            <Button
              variant="secondary"
              onClick={() => {
                window.location.reload()
              }}
            >
              Reload
            </Button>
            <Link to="/" className="text-sm font-medium text-brand-800 underline">
              Go home
            </Link>
          </>
        }
      />
    </main>
  )
}
