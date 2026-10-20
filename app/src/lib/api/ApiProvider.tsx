import type { ReactNode } from 'react'

import { ApiContext } from './context'
import type { Api } from './index'

export function ApiProvider({ api, children }: { api: Api; children: ReactNode }) {
  return <ApiContext value={api}>{children}</ApiContext>
}
