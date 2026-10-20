import type { ReactNode } from 'react'

export interface EmptyStateProps {
  title: string
  description?: string | undefined
  /** Usually a Button or Link that gets the person out of the empty state. */
  action?: ReactNode | undefined
}

export function EmptyState({ title, description, action }: EmptyStateProps) {
  return (
    <section className="rounded-lg border border-dashed border-slate-300 bg-white px-6 py-10 text-center">
      <h2 className="text-lg font-semibold text-slate-900">{title}</h2>
      {description && <p className="mt-2 text-slate-600">{description}</p>}
      {action && <div className="mt-6 flex justify-center">{action}</div>}
    </section>
  )
}
