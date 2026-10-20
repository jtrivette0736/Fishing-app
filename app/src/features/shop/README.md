# Feature folders

Each product feature is one folder under `src/features/`, owning everything specific to it:

```
src/features/<feature>/
  api/        create<Feature>Api(client): typed functions returning Result<T, ApiError>
              plus create<Feature>DemoApi() with the same shape backed by memory.
              The ONLY place (with src/lib/api and src/lib/auth) that may import the Supabase client.
  components/ screens and parts used only by this feature (shared UI lives in src/components)
  hooks/      useX() hooks wrapping React Query: keys from src/lib/query/keys.ts, data via useApi()
  types.ts    the feature's domain types, derived from Database['public']['Tables'][...] where possible
  schemas.ts  Zod schemas for forms, URL params and anything else that crosses a boundary
  index.ts    what the rest of the app may import
```

## Adding a feature (5b onward)

1. Migration first: `supabase/migrations/NNNN_<feature>.sql` with tables, RLS policies, indexes
   and `updated_at` triggers; a matching `supabase/tests/NNNN_<feature>.sql`; `npm run test:sql`.
2. `npm run db:types` to refresh `src/lib/supabase/types.ts`.
3. `api/`: `create<Feature>Api(client)` using `run()` from `src/lib/api` so every call returns a
   `Result`; a demo twin for demo mode and tests.
4. Register both in `createApi()` / `createDemoApi()` (`src/lib/api/index.ts`) and add the
   feature's keys to `queryKeys`.
5. Hooks, then screens. Every data-driven view has loading, empty and error states.
6. A route in `src/app/router.tsx` under the right layout.
7. Tests next to the code (`*.test.ts(x)`), rendered through `src/test/render.tsx`.

`shop/` is reserved for the tenant itself (shop record, members, public page settings). It is
empty on purpose until the product definition fixes the schema.
