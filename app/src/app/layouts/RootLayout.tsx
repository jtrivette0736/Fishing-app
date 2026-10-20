import { Outlet, ScrollRestoration } from 'react-router-dom'

/** Shared by every page: a skip link for keyboard users and the main landmark. */
export function RootLayout() {
  return (
    <>
      <a
        href="#main"
        className="sr-only focus:not-sr-only focus:fixed focus:top-2 focus:left-2 focus:z-50 focus:rounded-md focus:bg-white focus:px-3 focus:py-2 focus:shadow"
      >
        Skip to content
      </a>
      <Outlet />
      <ScrollRestoration />
    </>
  )
}
