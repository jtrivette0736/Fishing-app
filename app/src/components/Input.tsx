import type { ComponentProps } from 'react'

import { cn } from '@/lib/cn'

export interface InputProps extends ComponentProps<'input'> {
  /** Set by <Field> when it has an error; styles the border and sets aria-invalid. */
  invalid?: boolean | undefined
}

export function Input({ invalid = false, className, type = 'text', ...rest }: InputProps) {
  return (
    <input
      type={type}
      aria-invalid={invalid || undefined}
      className={cn(
        'block w-full rounded-md border bg-white px-3 py-2 text-slate-900 shadow-sm',
        'placeholder:text-slate-400 disabled:bg-slate-100 disabled:text-slate-500',
        invalid ? 'border-red-500' : 'border-slate-300',
        className,
      )}
      {...rest}
    />
  )
}
