import { describe, expect, it } from 'vitest'

import { type PostgrestResponseLike, run } from './postgrest'

const resolved = <T>(value: PostgrestResponseLike<T>): PromiseLike<PostgrestResponseLike<T>> =>
  Promise.resolve(value)

describe('run', () => {
  it('returns ok with the data when PostgREST succeeds', async () => {
    const result = await run(resolved({ data: [{ id: 1 }], error: null }))
    expect(result).toEqual({ ok: true, data: [{ id: 1 }] })
  })

  it('keeps a null row from maybeSingle() as data, not an error', async () => {
    const result = await run(resolved<{ id: number } | null>({ data: null, error: null }))
    expect(result).toEqual({ ok: true, data: null })
  })

  it('maps a PostgREST error to an ApiError', async () => {
    const result = await run(
      resolved({
        data: null,
        error: { code: 'PGRST116', message: 'no rows', details: '', hint: '' },
      }),
    )
    expect(result.ok).toBe(false)
    if (!result.ok) expect(result.error.code).toBe('not_found')
  })

  it('turns a rejected request (no network) into a network ApiError', async () => {
    const result = await run<never>(Promise.reject(new TypeError('Failed to fetch')))
    expect(result.ok).toBe(false)
    if (!result.ok) expect(result.error.code).toBe('network')
  })
})
