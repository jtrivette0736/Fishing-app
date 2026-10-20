import { type ReactNode, useId } from 'react'

/** What a Field hands to its control so label, hint and error are wired for assistive tech. */
export interface FieldControlProps {
  id: string
  'aria-describedby': string | undefined
  invalid: boolean
}

export interface FieldProps {
  label: string
  hint?: string | undefined
  error?: string | undefined
  /** Render the control with the props Field gives you: `{(f) => <Input {...f} />}` */
  children: (control: FieldControlProps) => ReactNode
}

/**
 * Label + control + hint + error. The error is announced as it appears (aria-live) and linked
 * to the control through aria-describedby, so it reads the same with a screen reader.
 */
export function Field({ label, hint, error, children }: FieldProps) {
  const id = useId()
  const hintId = `${id}-hint`
  const errorId = `${id}-error`
  const describedBy = [hint ? hintId : null, error ? errorId : null].filter(Boolean).join(' ')

  return (
    <div className="space-y-1.5">
      <label htmlFor={id} className="block text-sm font-medium text-slate-800">
        {label}
      </label>
      {children({
        id,
        'aria-describedby': describedBy === '' ? undefined : describedBy,
        invalid: error !== undefined,
      })}
      {hint && (
        <p id={hintId} className="text-sm text-slate-500">
          {hint}
        </p>
      )}
      <p id={errorId} aria-live="polite" className="text-sm text-red-700">
        {error}
      </p>
    </div>
  )
}
