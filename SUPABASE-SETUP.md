# Arrangörsportal — så kopplar du på databasen (Supabase)

Portalen (`portal.html`) och live-läget på publika sidan behöver en gratis
Supabase-databas. Detta gör du **en gång**. Tar ca 10 minuter.

---

## 1. Skapa ett Supabase-projekt (gratis)

1. Gå till **https://supabase.com** → **Start your project** → logga in (t.ex. med GitHub).
2. **New project**. Välj:
   - **Name:** `stockholm-cup-of-nations`
   - **Database Password:** välj ett starkt lösenord (spara det, du behöver det sällan).
   - **Region:** `Europe (Stockholm)` eller närmaste.
3. Klicka **Create new project** och vänta ~1 min tills det är klart.

## 2. Skapa tabellerna

1. I vänstermenyn: **SQL Editor** → **New query**.
2. Öppna filen **`supabase-schema.sql`** (ligger i projektmappen), kopiera allt.
3. Klistra in i SQL-rutan → tryck **Run** (▶).
4. Det ska stå *Success. No rows returned*. Nu finns tabellerna `teams` och `matches`.

## 3. Hämta nycklarna och fyll i configen

1. I vänstermenyn: **Project Settings** (kugghjulet) → **API**.
2. Kopiera:
   - **Project URL** (ser ut som `https://abcdefgh.supabase.co`)
   - **anon public** (en lång nyckel — denna är säker att ha i koden)
3. Öppna **`supabase-config.js`** och fyll i:

```js
window.SCON_SUPABASE = {
  url:     "https://abcdefgh.supabase.co",   // din Project URL
  anonKey: "eyJhbGciOi...din-anon-nyckel...", // anon public
  year:    2026
};
```

> **Skicka gärna dessa två värden till mig** så lägger jag in dem och driftsätter — annars klart att göra själv enligt ovan.

## 4. Skapa ett inloggningskonto för arrangörerna

Portalen har **ingen öppen registrering** (så bara ni kommer in). Lägg till konton manuellt:

1. I vänstermenyn: **Authentication** → **Users** → **Add user** → **Create new user**.
2. Fyll i **e-post** + **lösenord** för varje arrangör. Bocka i **Auto Confirm User**.
3. Upprepa för alla som ska ha tillgång.

> Vill du slippa lösenord kan man senare slå på “magic link”-inloggning via e-post — säg till.

## 5. Klart!

- Öppna **`portal.html`** → logga in med kontot du skapade → lägg in lag och resultat.
- På publika sidan dyker en röd **”2026”-flik** upp i resultatsektionen så fort ni lagt in minst ett lag, och den uppdateras live när ni sparar resultat.

---

## Så här jobbar arrangörerna i portalen

1. **Lag** — lägg in alla deltagande nationer (namn + valfri flagg-emoji), tilldela grupp A–H.
2. **Gruppmatcher** — tryck *”Generera gruppmatcher”* → alla möten skapas automatiskt. Fyll i resultat efter hand.
3. **Grupper & tabeller** — tabellerna räknas ut automatiskt (3 p för vinst). Topp 2 markeras.
4. **Slutspel** — lägg till åttondels-/kvarts-/semifinal/final, fyll i resultat (och straffar vid oavgjort).

Allt sparas direkt i databasen och syns på publika sidan.

---

## Säkerhet & kostnad

- **Gratis:** Supabas free-tier räcker med god marginal för en turnering.
- **Läsning** är öppen (så publika sidan kan visa resultat) men innehåller bara turneringsdata — inga personuppgifter.
- **Ändringar** kräver inloggning; `anon`-nyckeln kan inte skriva utan giltig användarsession (skyddas av Row Level Security i schemat).
- Vill du ge bort sajten: den nya ägaren skapar sitt eget Supabase-projekt och byter de två värdena i `supabase-config.js`. Inget annat behöver ändras.
