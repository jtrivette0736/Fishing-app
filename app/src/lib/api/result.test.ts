import { describe, expect, it } from 'vitest'

import { fromAuthError, fromPostgrestError } from './errors'
import {
  apiError,
  ApiRequestError,
  DEFAULT_MESSAGES,
  err,
  isApiError,
  mapResult,
  ok,
  type Result,
  toApiError,
  unwrap,
} from './result'

describe('Result', () => {
  it('ok and err build the two shapes', () => {
    expect(ok(1)).toEqual({ ok: true, data: 1 })
    expect(err(apiError('not_found'))).toEqual({
      ok: false,
      error: { code: 'not_found', message: DEFAULT_MESSAGES.not_found },
    })
  })

  it('apiError falls back to the plain-English default per code', () => {
    expect(apiError('network').message).toMatch(/connection/)
    expect(apiError('invalid', 'Slug is taken').message).toBe('Slug is taken')
    expect(apiError('unknown', undefined, new Error('x')).cause).toBeInstanceOf(Error)
    expect('cause' in apiError('unknown')).toBe(false)
  })

  it('unwrap returns data or throws an ApiRequestError carrying the code', () => {
    expect(unwrap(ok('data'))).toBe('data')
    const failed: Result<string> = err(apiError('forbidden'))
    expect(() => unwrap(failed)).toThrow(ApiRequestError)
    try {
      unwrap(failed)
    } catch (thrown) {
      expect(thrown).toBeInstanceOf(ApiRequestError)
      if (thrown instanceof ApiRequestError) {
        expect(thrown.code).toBe('forbidden')
        expect(thrown.message).toBe(DEFAULT_MESSAGES.forbidden)
      }
    }
  })

  it('mapResult transforms data and leaves errors alone', () => {
    expect(mapResult(ok(2), (n) => n * 2)).toEqual({ ok: true, data: 4 })
    const failed: Result<number> = err(apiError('conflict'))
    expect(mapResult(failed, (n) => n * 2)).toBe(failed)
  })

  it('isApiError recognises the shape and nothing else', () => {
    expect(isApiError(apiError('invalid'))).toBe(true)
    expect(isApiError({ code: 'weird', message: 'x' })).toBe(false)
    expect(isApiError(new Error('x'))).toBe(false)
    expect(isApiError(null)).toBe(false)
  })

  it('toApiError turns thrown values back into ApiErrors', () => {
    expect(toApiError(new ApiRequestError(apiError('rate_limited'))).code).toBe('rate_limited')
    expect(toApiError(new TypeError('Failed to fetch')).code).toBe('network')
    expect(toApiError(new Error('boom')).code).toBe('unknown')
    expect(toApiError('string').message).toBe(DEFAULT_MESSAGES.unknown)
  })
})

describe('fromPostgrestError', () => {
  const pg = (code: string, message = 'db says no') => ({ code, message, details: '', hint: '' })

  it('maps the codes the UI needs to tell apart', () => {
    expect(fromPostgrestError(pg('PGRST116')).code).toBe('not_found')
    expect(fromPostgrestError(pg('42501')).code).toBe('forbidden')
    expect(fromPostgrestError(pg('23505')).code).toBe('conflict')
    expect(fromPostgrestError(pg('23503')).code).toBe('invalid')
    expect(fromPostgrestError(pg('22P02')).code).toBe('invalid')
    expect(fromPostgrestError(pg('PGRST301')).code).toBe('unauthorized')
    expect(fromPostgrestError(pg('57014')).code).toBe('unavailable')
    expect(fromPostgrestError(pg('XX000')).code).toBe('unknown')
  })

  it('shows our own RAISE messages but never raw Postgres ones', () => {
    expect(fromPostgrestError(pg('P0001', 'That slug is already taken.')).message).toBe(
      'That slug is already taken.',
    )
    expect(fromPostgrestError(pg('23505', 'duplicate key value violates...')).message).toBe(
      DEFAULT_MESSAGES.conflict,
    )
  })
})

describe('fromAuthError', () => {
  it('maps GoTrue failures', () => {
    expect(fromAuthError({ message: 'Invalid login credentials', status: 400 })).toMatchObject({
      code: 'invalid',
      message: "That email and password don't match.",
    })
    expect(fromAuthError({ message: 'x', status: 400, code: 'email_not_confirmed' }).code).toBe(
      'invalid',
    )
    expect(fromAuthError({ message: 'Too many', status: 429 }).code).toBe('rate_limited')
    expect(fromAuthError({ message: 'down', status: 503 }).code).toBe('unavailable')
    expect(fromAuthError({ message: 'Failed to fetch' }).code).toBe('network')
    expect(fromAuthError({ message: 'odd', status: 418 }).code).toBe('unknown')
  })
})
