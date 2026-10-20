import { useQuery } from '@tanstack/react-query'
import { Link, useParams } from 'react-router-dom'
import { z } from 'zod'

import { Badge, EmptyState, ErrorState, PageHeader, Spinner } from '@/components'
import { toApiError } from '@/lib/api'
import { queryKeys } from '@/lib/query/keys'

/** Shop slugs: lowercase letters, digits and hyphens, 3-64 characters, no leading/trailing hyphen. */
const shopSlugSchema = z
  .string()
  .regex(/^[a-z0-9](?:[a-z0-9-]{1,62}[a-z0-9])$/, 'Not a valid shop address')

interface PublicShopPlaceholder {
  readonly slug: string
  readonly name: string
}

/**
 * Placeholder lookup until 5b wires `useApi().shops.publicBySlug(slug)`. Resolves one fake shop
 * so the page can show its loaded state; every other slug is "no shop here".
 */
function lookupShopPlaceholder(slug: string): Promise<PublicShopPlaceholder | null> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve(slug === 'demo' ? { slug, name: 'Demo Reel Service' } : null)
    }, 400)
  })
}

/**
 * /s/:shopSlug: the shop's public, indexable intake page (validation gate C7). Anyone can open it;
 * nothing here needs a session.
 */
export function ShopPublicPage() {
  const { shopSlug = '' } = useParams()
  const slug = shopSlugSchema.safeParse(shopSlug)

  const shop = useQuery({
    queryKey: queryKeys.publicShop.bySlug(shopSlug),
    queryFn: () => lookupShopPlaceholder(shopSlug),
    enabled: slug.success,
  })

  if (!slug.success) {
    return (
      <EmptyState
        title="That isn't a shop address"
        description="Shop pages look like /s/your-shop-name. Check the link you were given."
        action={<HomeLink />}
      />
    )
  }

  if (shop.status === 'pending') {
    return (
      <div className="flex justify-center py-16">
        <Spinner size="lg" label="Loading the shop page" />
      </div>
    )
  }

  if (shop.status === 'error') {
    return (
      <ErrorState
        title="Couldn't load this shop"
        message={toApiError(shop.error).message}
        onRetry={() => void shop.refetch()}
        retrying={shop.isFetching}
      />
    )
  }

  if (shop.data === null) {
    return (
      <EmptyState
        title="No shop here"
        description="There's no shop at this address. It may have moved or the link may be mistyped."
        action={<HomeLink />}
      />
    )
  }

  return (
    <article>
      <PageHeader
        title={shop.data.name}
        description="Send your reel or rod in for service. Tell us what it is and what it needs; we'll confirm by email."
        actions={<Badge tone="info">Intake form coming next</Badge>}
      />
      <EmptyState
        title="The intake form lands here"
        description="Prices, turnaround time and the request form are built in the next phase, on this page."
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
