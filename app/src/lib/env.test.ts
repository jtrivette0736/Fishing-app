import { describe, expect, it } from 'vitest'

import { isDemoEnv, parseEnv } from './env'

const supabase = {
  VITE_SUPABASE_URL: 'https://abcd.supabase.co',
  VITE_SUPABASE_ANON_KEY: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.anon-key-for-tests',
}

describe('parseEnv', () => {
  it('accepts a full Supabase configuration', () => {
    const env = parseEnv({ ...supabase, VITE_APP_URL: 'https://app.example.com' })
    expect(env.VITE_SUPABASE_URL).toBe(supabase.VITE_SUPABASE_URL)
    expect(env.VITE_APP_URL).toBe('https://app.example.com')
    expect(isDemoEnv(env)).toBe(false)
  })

  it('defaults VITE_APP_URL to the Vite dev server', () => {
    expect(parseEnv({}).VITE_APP_URL).toBe('http://localhost:5173')
  })

  it('runs in demo mode when both Supabase variables are absent', () => {
    expect(isDemoEnv(parseEnv({}))).toBe(true)
  })

  it('treats blank strings as absent (Netlify sets unset variables to "")', () => {
    const env = parseEnv({ VITE_SUPABASE_URL: '  ', VITE_SUPABASE_ANON_KEY: '' })
    expect(env.VITE_SUPABASE_URL).toBeUndefined()
    expect(isDemoEnv(env)).toBe(true)
  })

  it('ignores variables it does not know about', () => {
    expect(() => parseEnv({ MODE: 'test', VITE_SOMETHING_ELSE: 'x' })).not.toThrow()
  })

  it('refuses a URL that is not a URL, in plain English', () => {
    expect(() => parseEnv({ ...supabase, VITE_SUPABASE_URL: 'abcd.supabase.co' })).toThrow(
      /VITE_SUPABASE_URL must be a full URL/,
    )
  })

  it('refuses half a Supabase configuration instead of silently going demo', () => {
    expect(() => parseEnv({ VITE_SUPABASE_URL: supabase.VITE_SUPABASE_URL })).toThrow(
      /Set both VITE_SUPABASE_URL and VITE_SUPABASE_ANON_KEY/,
    )
    expect(() => parseEnv({ VITE_SUPABASE_ANON_KEY: supabase.VITE_SUPABASE_ANON_KEY })).toThrow(
      /Set both VITE_SUPABASE_URL and VITE_SUPABASE_ANON_KEY/,
    )
  })

  it('keeps the optional Turnstile key when present', () => {
    expect(parseEnv({ VITE_TURNSTILE_SITE_KEY: '0x4AAAA' }).VITE_TURNSTILE_SITE_KEY).toBe('0x4AAAA')
    expect(parseEnv({ VITE_TURNSTILE_SITE_KEY: '' }).VITE_TURNSTILE_SITE_KEY).toBeUndefined()
  })
})
