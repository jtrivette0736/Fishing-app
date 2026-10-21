// @ts-check
import js from '@eslint/js'
import prettier from 'eslint-config-prettier'
import jsxA11y from 'eslint-plugin-jsx-a11y'
import reactHooks from 'eslint-plugin-react-hooks'
import reactRefresh from 'eslint-plugin-react-refresh'
import { defineConfig, globalIgnores } from 'eslint/config'
import globals from 'globals'
import tseslint from 'typescript-eslint'

export default defineConfig(
  globalIgnores([
    'dist/**',
    'coverage/**',
    'node_modules/**',
    'supabase/.temp/**',
    // Generated from the database schema; regenerate with `npm run db:types`, never edit.
    'src/lib/supabase/types.ts',
  ]),

  // Application code: type-aware, strict.
  {
    files: ['src/**/*.{ts,tsx}'],
    extends: [
      js.configs.recommended,
      tseslint.configs.strictTypeChecked,
      tseslint.configs.stylisticTypeChecked,
      jsxA11y.flatConfigs.recommended,
      reactHooks.configs.flat.recommended,
      reactRefresh.configs.vite,
    ],
    languageOptions: {
      ecmaVersion: 2023,
      globals: globals.browser,
      parserOptions: {
        projectService: true,
        tsconfigRootDir: import.meta.dirname,
      },
    },
    rules: {
      // `any` needs a written reason on the same line (code-review-against-standards).
      '@typescript-eslint/no-explicit-any': 'error',
      // `onClick={() => setOpen(true)}` is idiomatic React; the void return is intentional.
      '@typescript-eslint/no-confusing-void-expression': ['error', { ignoreArrowShorthand: true }],
      // Async event handlers are fine in JSX attributes; React ignores the returned promise.
      '@typescript-eslint/no-misused-promises': ['error', { checksVoidReturn: { attributes: false } }],
      '@typescript-eslint/restrict-template-expressions': ['error', { allowNumber: true }],
      '@typescript-eslint/consistent-type-imports': ['error', { fixStyle: 'inline-type-imports' }],
      '@typescript-eslint/consistent-type-definitions': ['error', 'interface'],
      '@typescript-eslint/no-unused-vars': [
        'error',
        { argsIgnorePattern: '^_', varsIgnorePattern: '^_', caughtErrors: 'none' },
      ],
      // Phones handle browser dialogs badly; use in-page confirmation instead.
      'no-alert': 'error',
      'no-restricted-globals': ['error', 'alert', 'confirm', 'prompt'],
      // Only the data layer and auth talk to Supabase. Everything else goes through `useApi()`.
      'no-restricted-imports': [
        'error',
        {
          paths: [
            {
              name: '@supabase/supabase-js',
              message: 'Import the client only inside src/lib/api, src/lib/auth or features/*/api.',
            },
          ],
          patterns: [
            {
              group: ['**/lib/supabase/client', '@/lib/supabase/client'],
              message: 'Use useApi() / useAuth(); only src/lib/api and src/lib/auth may import the client.',
            },
          ],
        },
      ],
    },
  },

  // The client module, the data layer and auth are the only modules allowed to import Supabase.
  {
    files: [
      'src/lib/supabase/client.ts',
      'src/lib/api/**/*.ts',
      'src/lib/auth/**/*.{ts,tsx}',
      'src/features/*/api/**/*.ts',
    ],
    rules: { 'no-restricted-imports': 'off' },
  },

  // Tests: a little looser on unbound methods and non-null assertions.
  {
    files: ['src/**/*.test.{ts,tsx}', 'src/test/**/*.{ts,tsx}'],
    rules: {
      '@typescript-eslint/unbound-method': 'off',
      '@typescript-eslint/no-non-null-assertion': 'off',
      'react-refresh/only-export-components': 'off',
    },
  },

  // Node-side config and scripts: type-aware through tsconfig.node.json.
  {
    files: ['vite.config.ts', 'eslint.config.js', 'scripts/**/*.mjs'],
    extends: [js.configs.recommended, tseslint.configs.strictTypeChecked],
    languageOptions: {
      globals: globals.node,
      parserOptions: {
        projectService: true,
        tsconfigRootDir: import.meta.dirname,
      },
    },
  },

  // Prettier owns formatting; this must stay last.
  prettier,
)
