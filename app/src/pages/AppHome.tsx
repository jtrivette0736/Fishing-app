import { useQuery } from '@tanstack/react-query'

import { Badge, EmptyState, ErrorState, PageHeader, Spinner } from '@/components'
import { toApiError, unwrap, useApi } from '@/lib/api'
import { useAuth } from '@/lib/auth'
import { queryKeys } from '@/lib/query/keys'

/**
 * The signed-in home. In 5a it proves the whole chain works end to end (session -> data layer
 * -> database -> back) and shows the loading / error / empty pattern every data view follows.
 * 5b replaces the empty state with the job list.
 */
export function AppHome() {
  const api = useApi()
  const auth = useAuth()

  const health = useQuery({
    queryKey: queryKeys.health.check(),
    queryFn: () => api.health.check().then(unwrap),
  })

  return (
    <>
      <PageHeader
        title="Welcome back"
        description={auth.user?.email ? `Signed in as ${auth.user.email}.` : 'You are signed in.'}
      />

      <section aria-labelledby="connection-heading" className="mb-8">
        <h2 id="connection-heading" className="mb-2 text-sm font-medium text-slate-500">
          Connection
        </h2>
        {health.status === 'pending' && <Spinner label="Checking the connection" />}
        {health.status === 'error' && (
          <ErrorState
            title="Can't reach the database"
            message={toApiError(health.error).message}
            onRetry={() => void health.refetch()}
            retrying={health.isFetching}
          />
        )}
        {health.status === 'success' && (
          <p className="flex items-center gap-2 text-slate-700">
            <Badge tone="success">Connected</Badge>
            <span>
              {health.data.mode === 'demo' ? 'Demo data, in this browser only.' : 'Supabase'}{' '}
              Checked {new Date(health.data.checkedAt).toLocaleTimeString()}.
            </span>
          </p>
        )}
      </section>

      <EmptyState
        title="No jobs yet"
        description="Jobs, customers and the intake page arrive in the next phase. This workspace is the shell they land in."
      />
    </>
  )
}
