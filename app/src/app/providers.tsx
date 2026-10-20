import { QueryClientProvider } from '@tanstack/react-query'
import { type ReactNode, useState } from 'react'

import { ApiProvider, createAppApi } from '@/lib/api'
import { AuthProvider, createAppAuthService } from '@/lib/auth'
import { createQueryClient } from '@/lib/query/client'

/**
 * Everything the screens need from context, built once per app: the React Query client, the
 * data layer (`useApi()`) and the session (`useAuth()`). Demo or Supabase is decided inside the
 * two factories from the environment, so no screen ever asks which mode it is in.
 */
export function Providers({ children }: { children: ReactNode }) {
  const [queryClient] = useState(createQueryClient)
  const [api] = useState(createAppApi)
  const [authService] = useState(createAppAuthService)

  return (
    <QueryClientProvider client={queryClient}>
      <ApiProvider api={api}>
        <AuthProvider service={authService}>{children}</AuthProvider>
      </ApiProvider>
    </QueryClientProvider>
  )
}
