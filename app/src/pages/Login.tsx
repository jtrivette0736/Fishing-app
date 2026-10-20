import { type FormEvent, useState } from 'react'
import { Link, Navigate, useLocation } from 'react-router-dom'
import { z } from 'zod'

import { Badge, Button, Field, Input, PageHeader } from '@/components'
import { useAuth } from '@/lib/auth'

const magicLinkSchema = z.object({
  email: z.email({ error: 'Enter the email address you use for the shop.' }),
})

const passwordSchema = magicLinkSchema.extend({
  password: z.string().min(8, { error: 'Your password is at least 8 characters.' }),
})

type Method = 'magic_link' | 'password'

interface FormErrors {
  email?: string | undefined
  password?: string | undefined
  form?: string | undefined
}

function redirectTarget(state: unknown): string {
  const parsed = z.object({ from: z.string().startsWith('/') }).safeParse(state)
  return parsed.success ? parsed.data.from : '/app'
}

export function Login() {
  const auth = useAuth()
  const location = useLocation()
  const [method, setMethod] = useState<Method>('magic_link')
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [errors, setErrors] = useState<FormErrors>({})
  const [submitting, setSubmitting] = useState(false)
  const [linkSentTo, setLinkSentTo] = useState<string | null>(null)

  if (auth.status === 'signed_in') {
    return <Navigate to={redirectTarget(location.state)} replace />
  }

  const submit = async (event: FormEvent<HTMLFormElement>) => {
    event.preventDefault()
    setErrors({})

    const parsed =
      method === 'password'
        ? passwordSchema.safeParse({ email, password })
        : magicLinkSchema.safeParse({ email })
    if (!parsed.success) {
      const fields = z.flattenError(parsed.error).fieldErrors as Record<string, string[] | undefined>
      setErrors({ email: fields.email?.[0], password: fields.password?.[0] })
      return
    }

    setSubmitting(true)
    const result =
      method === 'password'
        ? await auth.signInWithPassword(parsed.data.email, password)
        : await auth.signInWithMagicLink(parsed.data.email)
    setSubmitting(false)

    if (!result.ok) {
      setErrors({ form: result.error.message })
      return
    }
    if (method === 'magic_link' && auth.mode === 'supabase') setLinkSentTo(parsed.data.email)
    // Password sign-in (and every demo sign-in) flips auth.status, which redirects above.
  }

  if (linkSentTo !== null) {
    return (
      <main id="main" className="mx-auto max-w-md px-4 py-16">
        <section className="rounded-lg border border-slate-200 bg-white p-6 text-center">
          <h1 className="text-xl font-semibold">Check your email</h1>
          <p className="mt-2 text-slate-600">
            We sent a sign-in link to <strong>{linkSentTo}</strong>. It works once and expires in an
            hour.
          </p>
          <Button
            variant="ghost"
            className="mt-6"
            onClick={() => {
              setLinkSentTo(null)
            }}
          >
            Use a different email
          </Button>
        </section>
      </main>
    )
  }

  return (
    <main id="main" className="mx-auto max-w-md px-4 py-16">
      <PageHeader
        title="Sign in"
        description="Shop members sign in here. Customers don't need an account: their status page link is all they need."
      />

      {auth.mode === 'demo' && (
        <p className="mb-4 rounded-md bg-amber-50 px-3 py-2 text-sm text-amber-900">
          <Badge tone="warning" className="mr-2">
            Demo mode
          </Badge>
          No back end is configured, so any email signs you in to a demo workspace.
        </p>
      )}

      <form onSubmit={submit} noValidate className="space-y-4 rounded-lg border border-slate-200 bg-white p-6">
        <Field label="Email" error={errors.email}>
          {(control) => (
            <Input
              {...control}
              type="email"
              name="email"
              autoComplete="email"
              inputMode="email"
              required
              value={email}
              onChange={(event) => {
                setEmail(event.target.value)
              }}
            />
          )}
        </Field>

        {method === 'password' && (
          <Field label="Password" error={errors.password}>
            {(control) => (
              <Input
                {...control}
                type="password"
                name="password"
                autoComplete="current-password"
                required
                value={password}
                onChange={(event) => {
                  setPassword(event.target.value)
                }}
              />
            )}
          </Field>
        )}

        {errors.form && (
          <p role="alert" className="rounded-md bg-red-50 px-3 py-2 text-sm text-red-800">
            {errors.form}
          </p>
        )}

        <Button type="submit" loading={submitting} className="w-full">
          {method === 'password' ? 'Sign in' : 'Email me a sign-in link'}
        </Button>

        <button
          type="button"
          className="w-full text-center text-sm text-brand-800 underline-offset-2 hover:underline"
          onClick={() => {
            setMethod(method === 'password' ? 'magic_link' : 'password')
            setErrors({})
          }}
        >
          {method === 'password' ? 'Email me a link instead' : 'Use a password instead'}
        </button>
      </form>

      <p className="mt-6 text-center text-sm text-slate-500">
        <Link to="/" className="underline-offset-2 hover:underline">
          Back to the start
        </Link>
      </p>
    </main>
  )
}
