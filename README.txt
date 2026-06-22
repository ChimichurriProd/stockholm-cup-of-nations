STOCKHOLM CUP OF NATIONS — website
==================================

This folder is a complete, self-contained static website.
- index.html  → the whole site (one file: HTML + CSS + JavaScript)
- img/        → all images used by the site

No server, database, or build step is required. Everything except the
YouTube video (which streams from YouTube) is bundled in this folder.

------------------------------------------------------------
HOW TO VIEW IT
------------------------------------------------------------
- Quick look: open index.html in a web browser.
  (The autoplay video works best when served over http/https, see below.)

------------------------------------------------------------
HOW TO PUBLISH IT (free, no maintenance)
------------------------------------------------------------
Option A — Netlify Drop (no account needed):
  1. Go to https://app.netlify.com/drop
  2. Drag this entire folder onto the page.
  3. You get a public URL immediately.

Option B — GitHub Pages / Vercel / Cloudflare Pages:
  Upload this folder; set index.html as the entry page.

To use the real domain (stockholmcupofnations.eu):
  Point the domain's DNS at your chosen host (one-time setup).

------------------------------------------------------------
HOW TO UPDATE CONTENT
------------------------------------------------------------
Open index.html in a text editor.
- Results for each year live in the JavaScript object called `YEARS`.
- The registration form emails: info@stockholmcupofnations.eu
- Language strings use data-en / data-sv attributes.
- Still to fill in before going live: entry fee, registration
  deadline, and sponsor logos (currently placeholders).

------------------------------------------------------------
NOTES
------------------------------------------------------------
- The registration form opens the visitor's email app (mailto).
  For automatic inbox delivery without a server, connect a free
  form service such as Formspree or Netlify Forms.
- The video is embedded from YouTube and requires an internet
  connection to play.
