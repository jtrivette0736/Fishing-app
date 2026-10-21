import { useQuery } from '@tanstack/react-query'
import { Link, useParams } from 'react-router-dom'
import { z } from 'zod'

import { Badge, EmptyState, ErrorState, PageHeader, Spinner } from '@/components'
import { toApiError } from '@/lib/api'
import { queryKeys } from '@/lib/query/keys'

/** Tokens come from public.gen_token(): base64url, at least 22 characters (16 bytes). */
const tokenSchema = z.string().regex(/^[A-Za-z0-9_-]{22,}$/, 'Not a valid link')

interface StatusPlaceholder {
  readonly shopName: string
  readonly itemLabel: string
  readonly status: string
}

/**
 * Placeholder until 5b wires the token lookup (ADR 0003: default is a SECURITY DEFINER RPC that
 * returns only what the customer may see). A token starting with "demo" shows the loaded state.
 */
function lookupStatusPlaceholder(token: string): Promise<StatusPlaceholder | null> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve(
        token.startsWith('demo')
          ? {
              shopName: 'Demo Reel Service',
              itemLabel: 'Shimano Stradic 3000',
              status: 'In progress',
            }
          : null,
      )
    }, 400)
  })
}

/** /t/:token: a customer's status page. No sign-in; the token in the link is the key. */
export function StatusPage() {
  const { token = '' } = useParams()
  const parsedToken = tokenSchema.safeParse(token)

  const status = useQuery({
    queryKey: queryKeys.statusPage.byToken(token),
    queryFn: () => lookupStatusPlaceholder(token),
    enabled: parsedToken.success,
  })

  if (!parsedToken.success || status.data === null) {
    return (
      <EmptyState
        title="This link isn't valid"
        description="Status links are personal and may expire. Ask the shop to send you a new one."
        action={<HomeLink />}
      />
    )
  }

  if (status.status === 'pending') {
    return (
      <div className="flex justify-center py-16">
        <Spinner size="lg" label="Loading your status page" />
      </div>
    )
  }

  if (status.status === 'error') {
    return (
      <ErrorState
        title="Couldn't load your status page"
        message={toApiError(status.error).message}
        onRetry={() => void status.refetch()}
        retrying={status.isFetching}
      />
    )
  }

  return (
    <article>
      <PageHeader
        title={status.data.itemLabel}
        description={`With ${status.data.shopName}`}
        actions={<Badge tone="info">{status.data.status}</Badge>}
      />
      <EmptyState
        title="Progress updates land here"
        description="The timeline, promised date and payment link are built in the next phase, on this page."
      />
    </article>
  )
}

function HomeLink() {
  return (
    <Link to="/" className="text-sm font-medium text-brand-800 underline">
      Go to the start
    </Link>
  )
}
