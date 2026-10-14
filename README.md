# MarginMate 2.0 — MVP 0.3

A lightweight product profitability workspace using a static HTML frontend and Supabase Auth/Postgres.

## Current features
- Email/password sign-in and account creation through Supabase Auth.
- User-owned product records and monthly profit goal saved in Supabase.
- Product profit calculator, margin calculation, product list, and CSV export.
- Product profitability comparison chart for up to six saved products.
- Row Level Security policies scope products and settings to `auth.uid() = user_id`.
- Local demo mode when Supabase config is not set (demo data stays in that browser only).

## Deploy
1. Upload the contents of this folder to your GitHub Pages repository.
2. In `config.js`, set `supabaseUrl` to your Supabase project URL and `supabaseAnonKey` to your Supabase publishable/anon key.
3. Never place a Supabase `service_role` key in browser code.
4. Run `supabase-schema.sql` in Supabase SQL Editor if setting up a new project. For an existing project, do not rerun blindly; compare its policies and tables first.
5. In Supabase Auth, configure your site's URL and redirect URLs for the deployed GitHub Pages address.

## Important analytics note
The chart compares estimated profit per sale from saved product costs. It is not a real sales history or actual monthly profit report. A proper sales trend requires a sales/transactions table and a form for recording completed sales; that is the next database feature to add.
