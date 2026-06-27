# O Líder que Deus Vê — Treinamento de Líderes

Apresentação interativa (slides em tela cheia) + interação ao vivo pelo celular
(estilo Mentimeter), com nuvem de palavras em tempo real.

## Arquivos

| Arquivo | O que é |
|---|---|
| `index.html` | A **apresentação** (telão). Abra e use em tela cheia. |
| `participar.html` | A **página do participante** (celular). É para onde o QR Code leva. |
| `config.js` | URL do Supabase + chave **anon** (pública) e o texto das 3 perguntas. |
| `supabase-setup.sql` | Script para criar as tabelas no Supabase (rode 1 vez). |
| `vercel.json` | Configuração do deploy na Vercel. |
| `assets/logo-mark.png` | Logo NEW (máscara, recolorida por CSS). |

## Slides
1. Capa — *O Líder que Deus Vê*
2. O Iceberg da Liderança (interativo — passe o mouse acima/abaixo da água)
3. Versículo — *1 Timóteo 4:12*
4. Frase de impacto — *Adolescência não é desculpa para imaturidade*
5. QR Code para os participantes entrarem
6. Pergunta 1 + nuvem de palavras ao vivo
7. Pergunta 2 + nuvem de palavras ao vivo
8. Pergunta 3 + nuvem de palavras ao vivo

### Navegação
`←` / `→` ou `Espaço` para passar os slides · `F` para tela cheia · `Home`/`End` para ir ao início/fim.
Dá para abrir um slide direto pela URL: `...#3` abre o slide 3.

## Passo a passo

### 1) Criar as tabelas no Supabase (só uma vez)
1. Entre no painel do Supabase do projeto `wanpmexubwgvxxmlhnlx`.
2. **SQL Editor → New query**, cole todo o conteúdo de `supabase-setup.sql` e clique **Run**.
3. (O script já adiciona `responses` e `presentation_state` ao Realtime. Se quiser conferir: **Database → Publications → supabase_realtime**.)

### 2) Publicar na Vercel
- Suba esta pasta para um repositório e importe na Vercel **ou** rode `vercel` na pasta.
- É um site **estático** (sem build). A Vercel publica automaticamente.
- Depois do deploy você terá algo como `https://seu-projeto.vercel.app`.
  - Telão: `https://seu-projeto.vercel.app/`
  - Participante: `https://seu-projeto.vercel.app/participar`
- O **QR Code do slide 5 é gerado sozinho** apontando para a página `participar` no mesmo domínio. Não precisa configurar URL manualmente.

### 3) Como funciona a interação ao vivo
- Quando você navega para o slide 6, 7 ou 8, o telão avisa o Supabase qual pergunta está ativa.
- O celular de quem escaneou o QR mostra automaticamente **a pergunta que está no telão** e um campo para responder.
- Cada resposta enviada cai na **nuvem de palavras** do telão na hora. Respostas iguais crescem e ganham um contador (ex.: ×3).

## Antes de cada nova turma (limpar respostas)
No SQL Editor do Supabase:
```sql
truncate public.responses;
update public.presentation_state set active_question = 0 where id = 1;
```

## ⚠️ Segurança importante
- No `config.js` só está a chave **anon** (pública) — é o correto para o navegador.
- A chave **service_role** que você me enviou **NÃO** está em nenhum arquivo e **nunca** deve ir para o front-end nem para o Git (ela ignora todas as regras de segurança). Como ela foi compartilhada no chat, o ideal é **rotacioná-la** no painel do Supabase (Settings → API → Reset) por precaução.
