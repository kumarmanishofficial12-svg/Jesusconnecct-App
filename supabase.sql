create table if not exists progress (
  id uuid primary key default gen_random_uuid(),
  verse text,
  country text,
  language text,
  completed boolean default false,
  created_at timestamptz default now()
);

alter table progress enable row level security;

create policy "Allow insert" on progress
for insert
with check (true);

create policy "Allow read" on progress
for select
using (true);