import { QueryClient } from '@tanstack/react-query'

import { ApiRequestError } from '@/lib/api/result'

/** Don't retry what a retry can't fix: bad input, missing rows, no access. */
const NO_RETRY = new Set(['invalid', 'not_found', 'forbidden', 'unauthorized', 'conflict'])

export function createQueryClient(): QueryClient {
  return new QueryClient({
    defaultOptions: {
      queries: {
        staleTime: 30_000,
        refetchOnWindowFocus: false,
        retry: (failureCount, error) => {
          if (error instanceof ApiRequestError && NO_RETRY.has(error.code)) return false
          return failureCount < 2
        },
      },
      mutations: { retry: false },
    },
  })
}
