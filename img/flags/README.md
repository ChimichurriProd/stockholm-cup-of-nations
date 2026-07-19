# Flaggor — Stockholm Cup of Nations 2026

Riktiga flaggfiler i stället för emojis, för hemsidan och grafik.

- **`svg/`** — vektor, skarp i alla storlekar. **Använd dessa på hemsidan.**
- **`png/`** — högupplöst raster (2560 px bred), för After Effects/Resolve/poster.

Filnamn = ISO-landskod (samma som `code` i Supabase-tabellen `teams`),
så på hemsidan blir det t.ex. `img/flags/svg/` + `code.toLowerCase()` + `.svg`.
Källa: flagcdn.com (Flagpedia). Kurdistan saknar ISO-kod och heter `kurdistan.*`
(källa: Wikimedia Commons).

| Fil | Nation | | Fil | Nation |
|---|---|---|---|---|
| `af` | Afghanistan | | `ni` | Nicaragua |
| `al` | Albanien | | `rs` | Serbien |
| `az` | Azerbajdzjan | | `sd` | Sudan |
| `ba` | Bosnien och Hercegovina | | `se` | Sverige |
| `bd` | Bangladesh | | `so` | Somalia * |
| `br` | Brasilien | | `ss` | Sydsudan * |
| `cd` | DR Kongo | | `sv` | El Salvador |
| `cl` | Chile | | `sy` | Syrien |
| `ec` | Ecuador | | `tj` | Tadzjikistan |
| `es` | Spanien | | `tz` | Tanzania |
| `fr` | Frankrike | | `ua` | Ukraina |
| `gm` | Gambia * | | `ug` | Uganda |
| `id` | Indonesien | | `uy` | Uruguay |
| `iq` | Irak * | | `uz` | Uzbekistan |
| `jo` | Jordanien | | `xk` | Kosovo |
| `kz` | Kazakstan | | `kurdistan` | Kurdistan |
| `mx` | Mexiko | | | |
| `ng` | Nigeria | | | |

\* Plats 13 (Somalia/Gambia) och plats 25 (Irak/Sydsudan) är inte bekräftade än —
båda alternativens flaggor finns nedladdade så rätt flagga redan finns när svaret kommer.

**Deploy:** mappen ligger i arbetsmappen. När flaggorna används på hemsidan,
kopiera till `site/img/flags/` och committa/pusha där som vanligt.
