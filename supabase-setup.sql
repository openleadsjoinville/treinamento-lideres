-- ============================================================
--  O Líder que Deus Vê — estrutura no Supabase
--  Cole isto em:  Supabase  ->  SQL Editor  ->  New query  ->  Run
-- ============================================================

-- 1) Respostas dos participantes (alimentam a nuvem de palavras)
create table if not exists public.responses (
  id          uuid primary key default gen_random_uuid(),
  question_id int  not null,
  text        text not null check (char_length(text) between 1 and 280),
  created_at  timestamptz not null default now()
);
create index if not exists responses_q_idx on public.responses (question_id, created_at);

-- 2) Estado da apresentação (qual pergunta está ativa no telão)
create table if not exists public.presentation_state (
  id              int  primary key,
  active_question int  not null default 0,   -- 0 = aguardando | 1..6 = pergunta ativa
  updated_at      timestamptz not null default now()
);
insert into public.presentation_state (id, active_question)
values (1, 0)
on conflict (id) do nothing;

-- 3) Segurança (RLS) — uso público de sala de aula, chave anon
alter table public.responses          enable row level security;
alter table public.presentation_state enable row level security;

drop policy if exists "responses_select" on public.responses;
drop policy if exists "responses_insert" on public.responses;
create policy "responses_select" on public.responses for select using (true);
create policy "responses_insert" on public.responses for insert with check (true);

drop policy if exists "state_select" on public.presentation_state;
drop policy if exists "state_insert" on public.presentation_state;
drop policy if exists "state_update" on public.presentation_state;
create policy "state_select" on public.presentation_state for select using (true);
create policy "state_insert" on public.presentation_state for insert with check (true);
create policy "state_update" on public.presentation_state for update using (true) with check (true);

-- 4) Realtime (faz o telão e os celulares atualizarem ao vivo)
alter publication supabase_realtime add table public.responses;
alter publication supabase_realtime add table public.presentation_state;

-- ------------------------------------------------------------
-- Para limpar as respostas antes de uma nova turma, rode:
--   truncate public.responses;
--   update public.presentation_state set active_question = 0 where id = 1;
-- ------------------------------------------------------------
