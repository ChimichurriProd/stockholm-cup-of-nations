-- Stockholm Cup of Nations — fan-omröstning ("vem tror du vinner?")
-- Kör EN gång i Supabase → SQL Editor → New query → klistra in → Run.
-- Idempotent. Isolerad, ADDITIV tabell: rör inte teams/matches/settings eller portalen.
--
-- Säkerhet: öppen läsning + öppen insert, men ENDAST för denna tabell. Den publika
-- (anon) nyckeln kan alltså skriva röster här, men fortfarande INTE röra
-- matches/teams/settings (deras policyer kräver inloggning och är oförändrade).

create table if not exists public.votes (
  id         uuid primary key default gen_random_uuid(),
  year       int  not null default 2026,
  match_id   uuid not null references public.matches(id) on delete cascade,
  pick       text not null check (pick in ('home','away')),
  voter      text not null,                 -- slumpat enhets-ID (localStorage), ej personuppgift
  created_at timestamptz default now(),
  unique (match_id, voter)                  -- en röst per enhet och match
);
create index if not exists votes_match_idx on public.votes(match_id);

alter table public.votes enable row level security;

-- Supabase: ge anon/authenticated tabellrättigheter (RLS-policyerna nedan gör grovjobbet)
grant select, insert on public.votes to anon, authenticated;

drop policy if exists "public read votes" on public.votes;
drop policy if exists "anon insert votes" on public.votes;
create policy "public read votes" on public.votes for select using (true);
create policy "anon insert votes" on public.votes for insert with check (true);
-- Medvetet INGEN update/delete-policy → röster är oföränderliga via anon-nyckeln.
