-- 0007: storage buckets and policies for job photos.
--
-- Product definition §7d. Two buckets, same path shape <shop_id>/<job_id>/<uuid>.<ext>:
--   job-photos         private; members of the shop in the path read/write/delete. Members open
--                      them through short-lived signed URLs minted in the data layer
--                      (features/jobs/api: photoUrl(), 5 minutes).
--   job-photos-shared  public read by exact path (listing disabled by Supabase for public
--                      buckets); the app uploads the resized copy of a photo the shop marks
--                      customer-visible, and job_by_token() returns those paths so the status
--                      page can show them without a session. Members write/delete as above.
-- Anonymous visitors have no storage policies at all: they never list, sign or upload.
-- Size and MIME limits are bucket settings on the hosted project (set below when the columns
-- exist; the local harness's storage stub has only id/name/public).

insert into storage.buckets (id, name, public)
values ('job-photos', 'job-photos', false), ('job-photos-shared', 'job-photos-shared', true)
on conflict (id) do nothing;

do $$
begin
  if exists (
    select 1 from information_schema.columns
    where table_schema = 'storage' and table_name = 'buckets' and column_name = 'file_size_limit'
  ) then
    update storage.buckets
    set file_size_limit = 2097152,
        allowed_mime_types = array['image/jpeg', 'image/png', 'image/webp']
    where id in ('job-photos', 'job-photos-shared');
  end if;
end;
$$;

-- True when the object path is <shop_id>/<job_id>/<file>, the caller is a member of that shop and
-- the job belongs to it. SECURITY DEFINER so the storage policy can check jobs without a grant.
create or replace function public.photo_path_allowed(p_name text)
returns boolean
language plpgsql
stable
security definer
set search_path = ''
as $$
declare
  f text[] := storage.foldername(p_name);
  v_shop uuid;
  v_job uuid;
begin
  if f is null or array_length(f, 1) <> 2 then return false; end if;
  if f[1] !~* '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$'
     or f[2] !~* '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$' then
    return false;
  end if;
  v_shop := f[1]::uuid;
  v_job := f[2]::uuid;
  return public.is_shop_member(v_shop)
    and exists (select 1 from public.jobs j where j.id = v_job and j.shop_id = v_shop and j.deleted_at is null);
end;
$$;
comment on function public.photo_path_allowed(text) is 'Storage policy helper: <shop_id>/<job_id>/<file> where the caller is a member of the shop and the job is the shop''s.';

create policy job_photos_member_select on storage.objects
  for select to authenticated
  using (bucket_id in ('job-photos', 'job-photos-shared') and public.photo_path_allowed(name));
create policy job_photos_member_insert on storage.objects
  for insert to authenticated
  with check (bucket_id in ('job-photos', 'job-photos-shared') and public.photo_path_allowed(name));
create policy job_photos_member_update on storage.objects
  for update to authenticated
  using (bucket_id in ('job-photos', 'job-photos-shared') and public.photo_path_allowed(name))
  with check (bucket_id in ('job-photos', 'job-photos-shared') and public.photo_path_allowed(name));
create policy job_photos_member_delete on storage.objects
  for delete to authenticated
  using (bucket_id in ('job-photos', 'job-photos-shared') and public.photo_path_allowed(name));

revoke all on function public.photo_path_allowed(text) from public, anon, authenticated;
grant execute on function public.photo_path_allowed(text) to authenticated, service_role;
