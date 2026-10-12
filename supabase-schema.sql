-- Run this SQL in Supabase Dashboard > SQL Editor.
-- Row Level Security restricts each signed-in user to their own records.
create table if not exists public.products (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  name text not null check (char_length(name) between 1 and 160),
  selling_price numeric(12,2) not null check (selling_price >= 0),
  product_cost numeric(12,2) not null default 0 check (product_cost >= 0),
  shipping_fees numeric(12,2) not null default 0 check (shipping_fees >= 0),
  ad_cost numeric(12,2) not null default 0 check (ad_cost >= 0),
  created_at timestamptz not null default now()
);
create table if not exists public.user_settings (
  user_id uuid primary key references auth.users(id) on delete cascade,
  monthly_goal numeric(12,2) not null default 1000 check (monthly_goal > 0),
  updated_at timestamptz not null default now()
);
alter table public.products enable row level security;
alter table public.user_settings enable row level security;
drop policy if exists "Users can view their own products" on public.products;
create policy "Users can view their own products" on public.products for select to authenticated using (auth.uid() = user_id);
drop policy if exists "Users can insert their own products" on public.products;
create policy "Users can insert their own products" on public.products for insert to authenticated with check (auth.uid() = user_id);
drop policy if exists "Users can delete their own products" on public.products;
create policy "Users can delete their own products" on public.products for delete to authenticated using (auth.uid() = user_id);
drop policy if exists "Users can view their own settings" on public.user_settings;
create policy "Users can view their own settings" on public.user_settings for select to authenticated using (auth.uid() = user_id);
drop policy if exists "Users can insert their own settings" on public.user_settings;
create policy "Users can insert their own settings" on public.user_settings for insert to authenticated with check (auth.uid() = user_id);
drop policy if exists "Users can update their own settings" on public.user_settings;
create policy "Users can update their own settings" on public.user_settings for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
grant select, insert, delete on public.products to authenticated;
grant select, insert, update on public.user_settings to authenticated;
