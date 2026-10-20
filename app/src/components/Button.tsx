import type { ComponentProps, ReactNode } from 'react'

import { cn } from '@/lib/cn'

import { Spinner } from './Spinner'

type Variant = 'primary' | 'secondary' | 'ghost' | 'danger'
type Size = 'sm' | 'md'

const VARIANTS: Record<Variant, string> = {
  primary: 'bg-brand-700 text-white hover:bg-brand-800 disabled:hover:bg-brand-700',
  secondary:
    'border border-slate-300 bg-white text-slate-900 hover:bg-slate-50 disabled:hover:bg-white',
  ghost: 'text-slate-700 hover:bg-slate-100 disabled:hover:bg-transparent',
  danger: 'bg-red-600 text-white hover:bg-red-700 disabled:hover:bg-red-600',
}

const SIZES: Record<Size, string> = {
  sm: 'px-3 py-1.5 text-sm',
  md: 'px-4 py-2 text-sm md:text-base',
}

export interface ButtonProps extends Omit<ComponentProps<'button'>, 'children'> {
  variant?: Variant | undefined
  size?: Size | undefined
  /** Shows a spinner, sets aria-busy and disables the button. */
  loading?: boolean | undefined
  children: ReactNode
}

export function Button({
  variant = 'primary',
  size = 'md',
  loading = false,
  disabled,
  className,
  type = 'button',
  children,
  ...rest
}: ButtonProps) {
  return (
    <button
      type={type}
      aria-busy={loading || undefined}
      disabled={disabled ?? loading}
      className={cn(
        'inline-flex items-center justify-center gap-2 rounded-md font-medium transition-colors',
        'disabled:cursor-not-allowed disabled:opacity-60',
        VARIANTS[variant],
        SIZES[size],
        className,
      )}
      {...rest}
    >
      {loading && <Spinner size="sm" label="Working" />}
      {children}
    </button>
  )
}
