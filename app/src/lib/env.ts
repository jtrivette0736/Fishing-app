import { z } from 'zod'

/**
 * Environment, validated once at startup. Only `VITE_*` variables reach the browser bundle.
 *
 * Demo mode: when neither Supabase variable is set the app runs entirely in the browser with a
 * fake signed-in user and in-memory data, so the UI can be developed and previewed with no
 * back end. Setting one of the two but not the other is a configuration mistake and fails loudly.
 */

const blankToUndefined = (value: unknown): unknown =>
  typeof value === 'string' && value.trim() === '' ? undefined : value

const envSchema = z
  .object({
    VITE_SUPABASE_URL: z.preprocess(
      blankToUndefined,
      z
        .url({ error: 'VITE_SUPABASE_URL must be a full URL, like https://abcd.supabase.co' })
        .optional(),
    ),
    VITE_SUPABASE_ANON_KEY: z.preprocess(
      blankToUndefined,
      z.string({ error: 'VITE_SUPABASE_ANON_KEY must be the project anon key' }).min(20).optional(),
    ),
    VITE_APP_URL: z.preprocess(
      blankToUndefined,
      z
        .url({ error: 'VITE_APP_URL must be a full URL, like https://app.example.com' })
        .default('http://localhost:5173'),
    ),
    VITE_TURNSTILE_SITE_KEY: z.preprocess(blankToUndefined, z.string().min(1).optional()),
  })
  .superRefine((value, ctx) => {
    const hasUrl = value.VITE_SUPABASE_URL !== undefined
    const hasKey = value.VITE_SUPABASE_ANON_KEY !== undefined
    if (hasUrl !== hasKey) {
      ctx.addIssue({
        code: 'custom',
        path: [hasUrl ? 'VITE_SUPABASE_ANON_KEY' : 'VITE_SUPABASE_URL'],
        message:
          'Set both VITE_SUPABASE_URL and VITE_SUPABASE_ANON_KEY to use Supabase, or neither to run in demo mode',
      })
    }
  })

export type Env = z.infer<typeof envSchema>

/** Parses a raw environment object. Throws a plain-English error listing every problem. */
export function parseEnv(raw: Readonly<Record<string, unknown>>): Env {
  const result = envSchema.safeParse(raw)
  if (!result.success) {
    throw new Error(
      `The app's environment is not configured correctly:\n${z.prettifyError(result.error)}\n` +
        'See .env.example for every variable.',
    )
  }
  return result.data
}

/** True when the app should run without a back end. */
export function isDemoEnv(value: Env): boolean {
  return value.VITE_SUPABASE_URL === undefined || value.VITE_SUPABASE_ANON_KEY === undefined
}

export const env: Env = parseEnv(import.meta.env)
export const isDemo: boolean = isDemoEnv(env)
