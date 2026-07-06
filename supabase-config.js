/* Stockholm Cup of Nations — Supabase-inställningar
 *
 * url         = projektets "Project URL"
 * anonKey     = den publika nyckeln (Publishable key, sb_publishable_…) — säker att ha i koden
 *               eftersom Row Level Security skyddar skrivning (endast inloggade arrangörer).
 * portalEmail = kontot som PIN-inloggningen i portal.html använder. PIN-koden = kontots
 *               lösenord i Supabase (Authentication → Users). Skapa gärna ett eget konto
 *               för kunden, t.ex. pin@stockholmcupofnations.se, och byt e-posten här.
 *
 * Vill du någon gång byta till ett annat Supabase-projekt: byt bara url + anonKey.
 */
window.SCON_SUPABASE = {
  url:         "https://mwempjsaylynnyzqdtno.supabase.co",
  anonKey:     "sb_publishable_D9RvjAByxZUld9C4WwfqVA_zTQzx4Kc",
  year:        2026,
  portalEmail: "chimichurriprod@gmail.com"
};
