# MarginMate v2 — Accounts and cloud database

This version keeps the profit calculator, product lab, monthly goal planner and CSV export, and adds Supabase email/password authentication and cloud storage.

## Architecture
GitHub Pages hosts the static website. Supabase provides authentication and the database. GitHub Pages alone cannot run a private backend/database.

## Setup

### 1. Create a Supabase project
1. Go to https://supabase.com/ and create a project.
2. Open **SQL Editor** in the project dashboard.
3. Open `supabase-schema.sql` from this folder, copy all SQL into SQL Editor and run it.
4. Find the **Project URL** and **anon/public/publishable key** in Project Settings → API (or the Connect panel).
5. Never use a `service_role` or secret key in browser code.

### 2. Configure `config.js`
Replace `YOUR_PROJECT_URL` and `YOUR_ANON_OR_PUBLISHABLE_KEY` with your project's values. Save the file. Keep it beside `index.html` in the repository root.

The public anon/publishable key is designed for browser use when Row Level Security is enabled. The included SQL policies restrict each signed-in user to their own records. Do not publish any service-role key.

### 3. Publish on GitHub Pages
1. Open your MarginMate repository, or create a new repository named `marginmate`.
2. Upload/replace `index.html`, `config.js`, and `supabase-schema.sql` at the repository root.
3. Open **Settings → Pages**.
4. Select **Deploy from a branch**, branch `main`, folder `/ (root)`, then save.
5. Wait for GitHub Pages to publish the site.

### 4. Configure Supabase auth URLs
In Supabase Dashboard → Authentication → URL Configuration:
- Set **Site URL** to your published URL, for example `https://YOUR-USERNAME.github.io/marginmate/`.
- Add the same URL to **Redirect URLs**. Keep the `/marginmate/` path for a GitHub Pages project site.
- If you later use a custom domain, add that domain too.

### 5. Test
1. Open the live site and choose **Create account**.
2. Use an email you can access and a password of at least 8 characters.
3. If email confirmation is enabled, confirm via email, return to the site and sign in.
4. Save a product and change the monthly goal.
5. Reload the site, sign in again, and confirm your data remains.
6. Create a second test account and verify it cannot see the first account's products.

## Demo mode
If `config.js` still contains placeholders, the site runs in local demo mode. Data stays in that browser/device and is not synced.

## Current limitations
- Currency is USD only.
- Product costs saved to cloud are taken from the calculator fields at the time of saving.
- This is an MVP, not yet ready to charge customers. Add password reset, editing, stronger error states, backup/monitoring, and a security review before production.
