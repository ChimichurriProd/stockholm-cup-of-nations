-- Migrering: lägger till spelschema-stöd (kolumner + settings-tabell).
-- Kör EN gång i Supabase → SQL Editor → New query → klistra in → Run.
-- Säker att köra även om delar redan finns (idempotent).

alter table public.matches add column if not exists pitch      int;
alter table public.matches add column if not exists sched_date text;   -- 'YYYY-MM-DD'
alter table public.matches add column if not exists sched_time text;   -- 'HH:MM'

create table if not exists public.settings (
  year       int primary key,
  data       jsonb not null default '{}',
  updated_at timestamptz default now()
);

alter table public.settings enable row level security;

drop policy if exists "public read settings" on public.settings;
create policy "public read settings" on public.settings for select using (true);

drop policy if exists "auth write settings" on public.settings;
create policy "auth write settings" on public.settings for all
  using (auth.uid() is not null) with check (auth.uid() is not null);
