import { Link } from 'react-router-dom'

import { EmptyState } from '@/components'

export function NotFound() {
  return (
    <main id="main" className="mx-auto max-w-xl px-4 py-16">
      <EmptyState
        title="Page not found"
        description="That address doesn't exist. Check the link, or go back to the start."
        action={
          <Link to="/" className="text-sm font-medium text-brand-800 underline">
            Go home
          </Link>
        }
      />
    </main>
  )
}
