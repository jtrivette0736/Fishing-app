import { createBrowserRouter, type RouteObject } from 'react-router-dom'

import { ProtectedRoute } from '@/lib/auth'
import { AppHome } from '@/pages/AppHome'
import { AuthCallback } from '@/pages/AuthCallback'
import { Landing } from '@/pages/Landing'
import { Login } from '@/pages/Login'
import { NotFound } from '@/pages/NotFound'
import { ShopPublicPage } from '@/pages/ShopPublicPage'
import { StatusPage } from '@/pages/StatusPage'

import { AppLayout } from './layouts/AppLayout'
import { PublicLayout } from './layouts/PublicLayout'
import { RootLayout } from './layouts/RootLayout'
import { RouteError } from './layouts/RouteError'

/**
 * Three areas, three layouts:
 *   /, /login, /auth/callback       marketing and sign-in (RootLayout only)
 *   /app/*                          the shop's workspace, signed in (ProtectedRoute + AppLayout)
 *   /s/:shopSlug, /t/:token         public pages customers open without an account (PublicLayout)
 */
export const routes: RouteObject[] = [
  {
    element: <RootLayout />,
    errorElement: <RouteError />,
    children: [
      { index: true, element: <Landing /> },
      { path: 'login', element: <Login /> },
      { path: 'auth/callback', element: <AuthCallback /> },
      {
        element: <ProtectedRoute />,
        children: [
          {
            element: <AppLayout />,
            children: [{ path: 'app', element: <AppHome /> }],
          },
        ],
      },
      {
        element: <PublicLayout />,
        children: [
          { path: 's/:shopSlug', element: <ShopPublicPage /> },
          { path: 't/:token', element: <StatusPage /> },
        ],
      },
      { path: '*', element: <NotFound /> },
    ],
  },
]

export function createAppRouter() {
  return createBrowserRouter(routes)
}
