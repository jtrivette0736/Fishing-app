import { cn } from '@/lib/cn'

type Size = 'sm' | 'md' | 'lg'

const SIZES: Record<Size, string> = {
  sm: 'size-4 border-2',
  md: 'size-6 border-2',
  lg: 'size-10 border-[3px]',
}

export interface SpinnerProps {
  /** Read by screen readers; keep it short ("Loading jobs"). */
  label?: string | undefined
  size?: Size | undefined
  className?: string | undefined
}

export function Spinner({ label = 'Loading', size = 'md', className }: SpinnerProps) {
  return (
    <span
      role="status"
      aria-live="polite"
      aria-label={label}
      className={cn('inline-flex items-center', className)}
    >
      <span
        aria-hidden="true"
        className={cn(
          'animate-spin rounded-full border-current border-r-transparent opacity-70',
          SIZES[size],
        )}
      />
      <span className="sr-only">{label}</span>
    </span>
  )
}
