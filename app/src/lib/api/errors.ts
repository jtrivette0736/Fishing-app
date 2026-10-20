import { type ApiError, apiError, DEFAULT_MESSAGES, toApiError } from './result'

/**
 * Maps Supabase/PostgREST/GoTrue failures to ApiError. Structural input types keep this
 * testable without constructing library classes.
 */

export interface PostgrestErrorLike {
  readonly code: string
  readonly message: string
  readonly details?: string | null
  readonly hint?: string | null
}

export interface AuthErrorLike {
  readonly message: string
  readonly status?: number | undefined
  readonly code?: string | undefined
}

/** Errors our own SQL raises (RAISE EXCEPTION) read well as-is; PostgREST's and Postgres's don't. */
const CODES_WITH_READABLE_MESSAGE = new Set(['P0001', '22023', '23514'])

export function fromPostgrestError(error: PostgrestErrorLike): ApiError {
  const { code } = error
  switch (code) {
    case 'PGRST116': // .single() found no row (or RLS hid it)
      return apiError('not_found', undefined, error)
    case 'PGRST301': // JWT expired / invalid
    case '401':
      return apiError('unauthorized', undefined, error)
    case '42501': // insufficient_privilege (RLS insert/update check, revoked grant)
      return apiError('forbidden', undefined, error)
    case '23505': // unique_violation
      return apiError('conflict', undefined, error)
    case '23503': // foreign_key_violation
    case '23502': // not_null_violation
    case '22P02': // invalid_text_representation (bad uuid, enum...)
    case 'PGRST102': // bad request body
      return apiError('invalid', undefined, error)
    case '57014': // statement_timeout
    case '53300': // too_many_connections
      return apiError('unavailable', undefined, error)
    default:
      if (CODES_WITH_READABLE_MESSAGE.has(code)) {
        return apiError('invalid', error.message, error)
      }
      return apiError('unknown', undefined, error)
  }
}

export function fromAuthError(error: AuthErrorLike): ApiError {
  switch (error.status) {
    case 400:
    case 422:
      if (error.code === 'invalid_credentials' || /invalid login/i.test(error.message)) {
        return apiError('invalid', "That email and password don't match.", error)
      }
      if (error.code === 'email_not_confirmed') {
        return apiError('invalid', 'Confirm your email first; we sent you a link.', error)
      }
      return apiError('invalid', error.message, error)
    case 401:
    case 403:
      return apiError('unauthorized', undefined, error)
    case 429:
      return apiError('rate_limited', undefined, error)
    case 500:
    case 502:
    case 503:
    case 504:
      return apiError('unavailable', undefined, error)
    default:
      if (/fetch|network/i.test(error.message)) return apiError('network', undefined, error)
      return apiError('unknown', DEFAULT_MESSAGES.unknown, error)
  }
}

/** For catch blocks around Supabase calls: thrown TypeErrors are network failures. */
export const fromUnknown = toApiError
