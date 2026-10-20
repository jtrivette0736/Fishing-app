import { createContext, useContext } from 'react'

import type { Api } from './index'

export const ApiContext = createContext<Api | null>(null)

/** The data layer for this app. Screens use this; nothing else imports the Supabase client. */
export function useApi(): Api {
  const api = useContext(ApiContext)
  if (api === null) {
    throw new Error('useApi() needs an <ApiProvider> above it (see src/app/providers.tsx).')
  }
  return api
}
