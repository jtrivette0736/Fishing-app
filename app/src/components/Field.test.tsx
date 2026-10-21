import { render, screen } from '@testing-library/react'
import { describe, expect, it } from 'vitest'

import { Field } from './Field'
import { Input } from './Input'

describe('Field', () => {
  it('labels the control and links hint and error for assistive tech', () => {
    render(
      <Field label="Email" hint="We only use it to sign you in." error="Enter an email address.">
        {(control) => <Input {...control} type="email" />}
      </Field>,
    )
    const input = screen.getByLabelText('Email')
    expect(input).toHaveAttribute('aria-invalid', 'true')
    expect(input).toHaveAccessibleDescription(
      'We only use it to sign you in. Enter an email address.',
    )
    expect(screen.getByText('Enter an email address.')).toBeInTheDocument()
  })

  it('is valid and undescribed when there is nothing to say', () => {
    render(<Field label="Name">{(control) => <Input {...control} />}</Field>)
    const input = screen.getByLabelText('Name')
    expect(input).not.toHaveAttribute('aria-invalid')
    expect(input).not.toHaveAttribute('aria-describedby')
  })
})
