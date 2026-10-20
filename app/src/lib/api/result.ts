/**
 * Every data-layer function returns a `Result` instead of throwing: callers handle failure where
 * it happens, and the UI always has a plain-English `message` to show. React Query wants thrown
 * errors, so `unwrap()` converts a failed Result into an `ApiRequestError` at that boundary.
 */

export type ApiErrorCode =
  | 'network'
  | 'unauthorized'
  | 'forbidden'
  | 'not_found'
  | 'conflict'
  | 'invalid'
  | 'rate_limited'
  | 'unavailable'
  | 'unknown'

export interface ApiError {
  readonly code: ApiErrorCode
  /** Plain English, safe to show to the person using the app. */
  readonly message: string
  /** The original error, for logging. Never shown. */
  readonly cause?: unknown
}

export type Result<T, E = ApiError> =
  | { readonly ok: true; readonly data: T }
  | { readonly ok: false; readonly error: E }

export function ok<T>(data: T): Result<T, never> {
  return { ok: true, data }
}

export function err<E>(error: E): Result<never, E> {
  return { ok: false, error }
}

/** Default wording per code. Specific functions may pass something more helpful. */
export const DEFAULT_MESSAGES: Readonly<Record<ApiErrorCode, string>> = {
  network: "We couldn't reach the server. Check your connection and try again.",
  unauthorized: 'Please sign in to continue.',
  forbidden: "You don't have access to that.",
  not_found: "That doesn't exist, or you don't have access to it.",
  conflict: 'That already exists.',
  invalid: "Something in what you entered isn't right.",
  rate_limited: 'Too many attempts. Wait a minute and try again.',
  unavailable: 'The service is briefly unavailable. Try again in a moment.',
  unknown: 'Something went wrong. Try again, and tell us if it keeps happening.',
}

export function apiError(code: ApiErrorCode, message?: string, cause?: unknown): ApiError {
  const error: { code: ApiErrorCode; message: string; cause?: unknown } = {
    code,
    message: message ?? DEFAULT_MESSAGES[code],
  }
  if (cause !== undefined) error.cause = cause
  return error
}

export function isApiError(value: unknown): value is ApiError {
  if (typeof value !== 'object' || value === null) return false
  const candidate = value as { code?: unknown; message?: unknown }
  return (
    typeof candidate.code === 'string' &&
    candidate.code in DEFAULT_MESSAGES &&
    typeof candidate.message === 'string'
  )
}

/** A thrown form of ApiError, for boundaries that need exceptions (React Query, loaders). */
export class ApiRequestError extends Error {
  readonly code: ApiErrorCode
  readonly apiError: ApiError

  constructor(error: ApiError) {
    super(error.message, error.cause === undefined ? undefined : { cause: error.cause })
    this.name = 'ApiRequestError'
    this.code = error.code
    this.apiError = error
  }
}

/** Returns the data or throws an `ApiRequestError`. Use at the React Query boundary. */
export function unwrap<T>(result: Result<T>): T {
  if (result.ok) return result.data
  throw new ApiRequestError(result.error)
}

export function mapResult<T, U, E>(result: Result<T, E>, fn: (data: T) => U): Result<U, E> {
  return result.ok ? { ok: true, data: fn(result.data) } : result
}

/** Turns anything that was thrown back into an ApiError for display. */
export function toApiError(thrown: unknown): ApiError {
  if (thrown instanceof ApiRequestError) return thrown.apiError
  if (isApiError(thrown)) return thrown
  if (thrown instanceof TypeError && /fetch|network/i.test(thrown.message)) {
    return apiError('network', undefined, thrown)
  }
  return apiError('unknown', undefined, thrown)
}
