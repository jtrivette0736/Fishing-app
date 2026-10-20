/**
 * Every React Query key in one place, so invalidation is grep-able and keys never drift.
 *
 * Convention: `<entity>.all` is the prefix for the whole entity; more specific keys extend it,
 * so `invalidateQueries({ queryKey: queryKeys.shops.all })` refreshes every shop query.
 * Phase 5b adds entities next to `health` (for example `shops`, `jobs`, `customers`).
 */
export const queryKeys = {
  health: {
    all: ['health'] as const,
    check: () => ['health', 'check'] as const,
  },
  /** Public, unauthenticated pages keyed by what is in the URL. */
  publicShop: {
    all: ['public-shop'] as const,
    bySlug: (slug: string) => ['public-shop', slug] as const,
  },
  statusPage: {
    all: ['status-page'] as const,
    byToken: (token: string) => ['status-page', token] as const,
  },
} as const
