import { fromPostgrestError, fromUnknown, type PostgrestErrorLike } from './errors'
import { err, ok, type Result } from './result'

/**
 * The shape every PostgREST builder resolves to (`PostgrestSingleResponse<T>` and friends):
 * data on success, a coded error on failure, never both.
 */
export type PostgrestResponseLike<T> =
  | { readonly data: T; readonly error: null }
  | { readonly data: null; readonly error: PostgrestErrorLike }

/**
 * Runs a PostgREST query and returns a Result. This is the one place where Supabase's
 * `{ data, error }` convention becomes ours, so every feature's api module reads the same way:
 *
 *   const shops = await run(client.from('shops').select('*').eq('slug', slug).maybeSingle())
 */
export async function run<T>(query: PromiseLike<PostgrestResponseLike<T>>): Promise<Result<T>> {
  try {
    const response = await query
    if (response.error) return err(fromPostgrestError(response.error))
    return ok(response.data)
  } catch (thrown) {
    return err(fromUnknown(thrown))
  }
}
