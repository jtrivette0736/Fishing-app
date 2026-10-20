/** Joins class names, skipping falsy values. Small enough not to need a dependency. */
export function cn(...parts: ReadonlyArray<string | false | null | undefined>): string {
  return parts.filter((part): part is string => typeof part === 'string' && part !== '').join(' ')
}
