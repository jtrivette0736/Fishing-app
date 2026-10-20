import type { ReactNode } from 'react'

import { Button } from './Button'

export interface ErrorStateProps {
  title?: string | undefined
  /** Plain English. Pass `error.message` from an ApiError, never a stack trace. */
  message: string
  onRetry?: (() => void) | undefined
  retrying?: boolean | undefined
  /** Extra way out, like a link home. */
  action?: ReactNode | undefined
}

export function ErrorState({
  title = 'Something went wrong',
  message,
  onRetry,
  retrying = false,
  action,
}: ErrorStateProps) {
  return (
    <div role="alert" className="rounded-lg border border-red-200 bg-red-50 px-6 py-8 text-center">
      <h2 className="text-lg font-semibold text-red-900">{title}</h2>
      <p className="mt-2 text-red-800">{message}</p>
      {(onRetry ?? action) && (
        <div className="mt-6 flex flex-wrap items-center justify-center gap-3">
          {onRetry && (
            <Button variant="secondary" onClick={onRetry} loading={retrying}>
              Try again
            </Button>
          )}
          {action}
        </div>
      )}
    </div>
  )
}
