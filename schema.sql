-- Run this in Supabase: Dashboard → SQL Editor → New query → paste all → Run
-- Safe to run in the SAME Supabase project you already have for reel — these are new tables.

create extension if not exists "pgcrypto";

create table stories (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  category text not null,
  content text not null,
  created_at timestamptz not null default now()
);

create table story_comments (
  id uuid primary key default gen_random_uuid(),
  story_id uuid not null references stories(id) on delete cascade,
  name text not null default 'Anonymous',
  text text not null,
  created_at timestamptz not null default now()
);

create table story_likes (
  id uuid primary key default gen_random_uuid(),
  story_id uuid not null references stories(id) on delete cascade,
  client_id text not null,
  created_at timestamptz not null default now(),
  unique (story_id, client_id)
);

alter table stories enable row level security;
alter table story_comments enable row level security;
alter table story_likes enable row level security;

create policy "public read stories" on stories for select using (true);
create policy "public read story comments" on story_comments for select using (true);
create policy "public read story likes" on story_likes for select using (true);

create policy "authenticated insert stories" on stories for insert with check (auth.role() = 'authenticated');
create policy "authenticated delete stories" on stories for delete using (auth.role() = 'authenticated');

create policy "public insert story comments" on story_comments for insert with check (true);

create policy "public insert story likes" on story_likes for insert with check (true);
create policy "public delete story likes" on story_likes for delete using (true);
