-- 0007: storage buckets and the member-only object policies for job photos.
\ir lib/fixtures.sql
select test.setup_two_shops();
select test.set('ja', (test.job_a() ->> 'id'));
select test.set('jb', (test.job_b() ->> 'id'));
select test.set('path_a', test.v('shop_a') || '/' || test.v('ja') || '/photo1.jpg');
select test.set('path_b', test.v('shop_b') || '/' || test.v('jb') || '/photo1.jpg');

\echo '--- buckets'
select test.eq((select public from storage.buckets where id = 'job-photos'), false, 'job-photos is private');
select test.eq((select public from storage.buckets where id = 'job-photos-shared'), true, 'job-photos-shared is public by exact path');

\echo '--- members write and read under <shop_id>/<job_id>/'
select test.as_a();
insert into storage.objects (bucket_id, name, owner) values ('job-photos', test.v('path_a'), test.id('user_a'));
insert into storage.objects (bucket_id, name, owner) values ('job-photos-shared', test.v('path_a'), test.id('user_a'));
select test.count('select * from storage.objects', 2, 'A sees their two objects');
select test.raises($q$ insert into storage.objects (bucket_id, name) values ('job-photos', test.v('path_b')) $q$,
  'A cannot write under shop B''s folder', '%row-level security%');
select test.raises($q$ insert into storage.objects (bucket_id, name) values ('job-photos', test.v('shop_a') || '/' || test.v('jb') || '/x.jpg') $q$,
  'A cannot write under a job that is not theirs', '%row-level security%');
select test.raises($q$ insert into storage.objects (bucket_id, name) values ('job-photos', test.v('shop_a') || '/loose.jpg') $q$,
  'the path must be shop/job/file', '%row-level security%');
select test.raises($q$ insert into storage.objects (bucket_id, name) values ('job-photos', 'not-a-uuid/' || test.v('ja') || '/x.jpg') $q$,
  'a non-uuid folder is refused', '%row-level security%');
select test.raises($q$ insert into storage.objects (bucket_id, name) values ('job-photos', test.v('shop_a') || '/' || test.v('ja') || '/sub/x.jpg') $q$,
  'no deeper folders', '%row-level security%');

\echo '--- another shop and anon'
select test.as_b();
select test.count('select * from storage.objects', 0, 'B sees none of A''s objects');
update storage.objects set metadata = '{"x": 1}' where name = test.v('path_a');
delete from storage.objects where name = test.v('path_a');
select test.as_admin();
select test.count('select * from storage.objects where name = test.v(''path_a'')', 2, 'B''s update and delete matched nothing');
select test.as_anon();
select test.count('select * from storage.objects', 0, 'anon lists nothing');
select test.raises($q$ insert into storage.objects (bucket_id, name) values ('job-photos-shared', test.v('path_a') || '2') $q$,
  'anon cannot upload', '%row-level security%');

\echo '--- job_photos rows mirror the buckets'
select test.as_a();
insert into public.job_photos (shop_id, job_id, kind, bucket, storage_path, customer_visible)
  values (test.id('shop_a'), test.id('ja'), 'intake', 'job-photos', test.v('path_a'), false);
select test.raises($q$ insert into public.job_photos (shop_id, job_id, kind, bucket, storage_path, customer_visible)
  values (test.id('shop_a'), test.id('ja'), 'progress', 'job-photos', test.v('path_a') || '-v', true) $q$,
  'a private-bucket photo cannot be customer-visible', '%job_photos_visible_bucket%');
insert into public.job_photos (shop_id, job_id, kind, bucket, storage_path, customer_visible)
  values (test.id('shop_a'), test.id('ja'), 'progress', 'job-photos-shared', 'shared/' || test.v('path_a'), true);
delete from storage.objects where name = test.v('path_a') and bucket_id = 'job-photos';
select test.count('select * from storage.objects', 1, 'A deleted their private copy');
select test.as_admin();
