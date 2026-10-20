import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
import { render, type RenderOptions, type RenderResult } from '@testing-library/react'
import type { ReactElement, ReactNode } from 'react'
import { MemoryRouter } from 'react-router-dom'

import { type Api, ApiProvider, createDemoApi } from '@/lib/api'
import { AuthProvider, type AuthService, createDemoAuthService } from '@/lib/auth'

export interface RenderWithProvidersOptions extends Omit<RenderOptions, 'wrapper'> {
  /** Initial URL for the MemoryRouter. */
  route?: string | undefined
  /** Defaults to the demo service signed in as the demo user. */
  auth?: AuthService | undefined
  /** Defaults to the demo api. */
  api?: Api | undefined
  queryClient?: QueryClient | undefined
}

export function createTestQueryClient(): QueryClient {
  return new QueryClient({
    defaultOptions: { queries: { retry: false, gcTime: 0 }, mutations: { retry: false } },
  })
}

/** Renders with the same providers the app has (React Query, Api, Auth) plus a MemoryRouter. */
export function renderWithProviders(
  ui: ReactElement,
  {
    route = '/',
    auth = createDemoAuthService(),
    api = createDemoApi(),
    queryClient = createTestQueryClient(),
    ...options
  }: RenderWithProvidersOptions = {},
): RenderResult {
  function Wrapper({ children }: { children: ReactNode }) {
    return (
      <QueryClientProvider client={queryClient}>
        <ApiProvider api={api}>
          <AuthProvider service={auth}>
            <MemoryRouter initialEntries={[route]}>{children}</MemoryRouter>
          </AuthProvider>
        </ApiProvider>
      </QueryClientProvider>
    )
  }
  return render(ui, { wrapper: Wrapper, ...options })
}

export { screen, waitFor, within } from '@testing-library/react'
export { default as userEvent } from '@testing-library/user-event'
