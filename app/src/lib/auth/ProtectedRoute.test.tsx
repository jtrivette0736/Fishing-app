import { Route, Routes } from 'react-router-dom'
import { describe, expect, it } from 'vitest'

import { renderWithProviders, screen, waitFor } from '@/test/render'

import { ProtectedRoute } from './ProtectedRoute'
import { type AuthService, createDemoAuthService, DEMO_USER } from './service'

function renderAt(route: string, auth: AuthService) {
  return renderWithProviders(
    <Routes>
      <Route path="/login" element={<p>Login page</p>} />
      <Route element={<ProtectedRoute />}>
        <Route path="/app" element={<p>App home</p>} />
      </Route>
    </Routes>,
    { route, auth },
  )
}

describe('ProtectedRoute', () => {
  it('redirects to /login when nobody is signed in', async () => {
    renderAt('/app', createDemoAuthService(null))
    expect(await screen.findByText('Login page')).toBeInTheDocument()
    expect(screen.queryByText('App home')).not.toBeInTheDocument()
  })

  it('renders the protected page when signed in (demo mode is signed in by default)', async () => {
    renderAt('/app', createDemoAuthService())
    expect(await screen.findByText('App home')).toBeInTheDocument()
  })

  it('shows a spinner while the session is still being read', () => {
    const pending: AuthService = {
      ...createDemoAuthService(null),
      getUser: () => new Promise(() => undefined),
    }
    renderAt('/app', pending)
    expect(screen.getByRole('status', { name: 'Checking your session' })).toBeInTheDocument()
    expect(screen.queryByText('Login page')).not.toBeInTheDocument()
  })

  it('follows sign-out and sign-in as they happen', async () => {
    const auth = createDemoAuthService(DEMO_USER)
    renderAt('/app', auth)
    expect(await screen.findByText('App home')).toBeInTheDocument()

    await auth.signOut()
    await waitFor(() => {
      expect(screen.getByText('Login page')).toBeInTheDocument()
    })
  })
})
