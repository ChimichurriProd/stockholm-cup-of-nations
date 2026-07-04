-- Migrering: automatiskt slutspelsträd.
-- Lägger till referens-kolumner så slutspelsmatcher kan skapas med platshållare
-- ("Etta grupp A", "Vinnare QF-1"...) som fylls i automatiskt när resultat matas in.
-- Kör EN gång i Supabase → SQL Editor. Idempotent (säker att köra flera gånger).

alter table public.matches add column if not exists code     text;  -- unikt matchkod, t.ex. 'QF-1'
alter table public.matches add column if not exists home_src text;  -- '1A' | '2B' | 'W:QF-1'
alter table public.matches add column if not exists away_src text;
