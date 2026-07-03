-- Stockholm Cup of Nations — turneringsdatabas
-- Kör detta EN gång i Supabase → SQL Editor → New query → klistra in → Run.
-- Skapar tabeller (lag + matcher) och säkerhetsregler:
--   • Alla får LÄSA (så publika sidan kan visa resultat)
--   • Endast inloggade arrangörer får ÄNDRA

create extension if not exists "pgcrypto";

-- ---------- LAG ----------
create table if not exists public.teams (
  id          uuid primary key default gen_random_uuid(),
  year        int  not null default 2026,
  code        text,                 -- valfri nationskod (t.ex. URU) för flagga
  name        text not null,        -- visningsnamn (t.ex. Uruguay)
  flag        text,                 -- emoji-flagga (t.ex. 🇺🇾)
  group_name  text,                 -- 'A'..'H' eller null
  sort_order  int  default 0,
  created_at  timestamptz default now()
);

-- ---------- MATCHER (gruppspel + slutspel) ----------
create table if not exists public.matches (
  id          uuid primary key default gen_random_uuid(),
  year        int  not null default 2026,
  stage       text not null default 'group',   -- 'group' | 'R16' | 'QF' | 'SF' | 'F'
  group_name  text,                             -- endast för gruppmatcher
  home_id     uuid references public.teams(id) on delete cascade,
  away_id     uuid references public.teams(id) on delete cascade,
  home_score  int,
  away_score  int,
  home_pens   int,                              -- straffar (slutspel), valfritt
  away_pens   int,
  status      text not null default 'scheduled', -- 'scheduled' | 'live' | 'finished'
  kickoff     timestamptz,
  sort_order  int  default 0,
  created_at  timestamptz default now()
);

create index if not exists teams_year_idx   on public.teams(year);
create index if not exists matches_year_idx on public.matches(year);

-- ---------- SÄKERHET (Row Level Security) ----------
alter table public.teams   enable row level security;
alter table public.matches enable row level security;

-- Läsning öppen för alla (publika sidan)
drop policy if exists "public read teams"   on public.teams;
drop policy if exists "public read matches" on public.matches;
create policy "public read teams"   on public.teams   for select using (true);
create policy "public read matches" on public.matches for select using (true);

-- Skrivning endast för inloggade arrangörer
drop policy if exists "auth write teams"   on public.teams;
drop policy if exists "auth write matches" on public.matches;
create policy "auth write teams"   on public.teams   for all
  using (auth.uid() is not null) with check (auth.uid() is not null);
create policy "auth write matches" on public.matches for all
  using (auth.uid() is not null) with check (auth.uid() is not null);
