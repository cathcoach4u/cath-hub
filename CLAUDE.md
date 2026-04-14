# CLAUDE.md - Cath Hub

## Working Style

- **No apologies.** Direct, action-oriented communication. Tell it straight.
- **Push to main.** All work goes to main branch (not feature branches).
- **Full coder approach.** You're here to code, not chat. Minimal explanation, maximum work.
- **Australian English.** Spelling, dates as DD/MM/YYYY, currency as AUD $.
- **No uppercase headings.** Use lowercase for all section headers (except titles).
- **Filter pills, not dropdowns.** Prefer horizontal filter pill buttons over dropdown menus.
- **Collapsible sections.** Default sections to collapsed when space is tight.

## Project Overview

Cath Hub is a personal health & household management PWA built with vanilla HTML/CSS/JS (no frameworks), Supabase backend, hosted on GitHub Pages. Repository: cathcoach4u/personal-cath-hub.

**Timezone:** Australia/Sydney (AEST/AEDT). Always use Sydney time.

## Architecture

Single-page app with Supabase backend and GitHub Pages hosting.

### infrastructure

- **GitHub Pages** — Static hosting, 1–2 min deploy time. Free tier, automatic HTTPS. [Link](https://pages.github.com/)
- **Supabase** — PostgreSQL database, auth, realtime, storage. Free tier: 500 MB database, 1 GB storage. Approx AUD $25–50/month at scale.

### AI services (replaceable)

Three separate, independent Claude services. Any can be swapped for alternatives.

1. **Claude Code** (development) — AI-assisted code generation and debugging via Claude Code CLI.
   - Current: Claude Haiku 4.5 (cheap, fast)
   - Alternatives: Claude Sonnet 4.6 (moderate cost), Claude Opus 4.6 (complex work only)
   - Cost: ~AUD $0.01–0.05 per session (typical)

2. **Claude Haiku** (chat) — Floating AI assistant in app, persistent memory via `ai_memory` table.
   - Current: Claude Haiku 3.5 via Anthropic API
   - Alternatives: GPT-4 Mini, Llama 3.1 70B
   - Cost: ~AUD $0.0001–0.0005 per message (via API)

3. **Claude Sonnet** (receipt scanning) — OCR and expense categorisation for receipts.
   - Current: Claude Sonnet 4.6 (vision enabled)
   - Alternatives: GPT-4 Vision, Gemini Pro Vision
   - Cost: ~AUD $0.03–0.10 per image (via API)

## technical foundation

- Single-page app: `index.html` contains all screens with sidebar navigation
- Standalone utility pages: `morning.html`, `todo.html`, `workout.html`
- Login via Supabase Auth (email/password) with optional PIN lock
- Navigation: `chNav(screenName, btn)` function switches screens
- All CSS is inline in `<style>` tags, scoped with `#cathHub` prefix and `!important`
- Dark mode toggle available
- No build step required — pure HTML/CSS/JS
- Deploy via GitHub Pages (push → 1–2 min until live)

## screens (in index.html)

1. **dashboard** (`ch-home`) — overview cards, shopping summary, recent receipts
2. **to-do** (`ch-todo`) — personal tasks with categories and due dates
3. **aislemate** (`ch-aislemate`) — shopping system with 9 subscreens (weekly list, master items, receipts, meal plan, family members, QR share, settings)
4. **workout log** (`ch-workout`) — exercise tracking with sets/reps, bottom-sheet picker
5. **medical** (`ch-medical`) — medications, sessions, contacts, mental health
6. **my habits** (`ch-habits`) — daily habit tracking with streaks
7. **travel** (`ch-travel`) — travel planning
8. **home** (`ch-hometab`) — household management
9. **about** (`ch-about`) — app info, tech stack, costs, persistent memory, key links

## standalone pages

- `morning.html` — morning medication auto-recording (Vyvanse, Valtrex, Levothyroxine)
- `todo.html` — personal to-do list with categories and due dates
- `workout.html` — workout logging with exercise library

## database schema

- `shopping_items` — name, category, store, checked, created_at
- `personal_todos` — task, done, category, due_date, created_at
- `fiona_tasks` — task, done, created_at
- `habit_meds` — id, name, freq ['daily', 'asneeded']
- `habit_logs` — med_id, date, created_at
- `medications` — name, dose, schedule, purpose
- `medical_sessions` — date, duration, plan, practitioner
- `master_items` — name, category, store, family_member, last_price
- `receipts` — store, receipt_date, total, uploaded_at
- `receipt_items` — item_name, price, receipt_id
- `meal_plans` — day_index, meal data
- `ai_memory` — fact, created_at (persistent memory)
- Storage bucket: `receipts` — receipt images/PDFs

## design system

### colors

- Top bar / sidebar / mobile nav: teal `#0d9488`
- Active nav highlight: `rgba(59,130,246,0.3)` with `#3b82f6` border
- Background: `#f8fafc`
- Cards: white with `#e2e8f0` border, 10px radius
- Text: `#1e293b` (headings), `#64748b` (labels), `#94a3b8` (meta)

### typography

- Font: `'Segoe UI', system-ui, -apple-system, sans-serif`
- Headings: 22px/700, Section labels: 14px/700, Body: 12–13px

### layout

- Desktop: 240px teal sidebar + white content area
- Mobile (under 768px): Sticky teal top bar with hamburger dropdown menu
- Cards: white, 1px border `#e2e8f0`, 10px radius, 16px padding
- Buttons: teal/dark background, white text, 7px radius
- Badges/tags: 9–10px font, pill shape, colour-coded backgrounds
- Tables: 10px uppercase headers, 12px body, hover highlight `#f8fafc`

### PWA

- `manifest.json` with standalone display, teal theme, SVG icons with white "C"
- Service worker: `service-worker.js` (cache-first strategy, version tagged)

## features

- Supabase authentication with email/password + PIN lock
- Dashboard with quick stats and navigation cards
- Shopping list management (AisleMate) with categories, stores, family members, master items, receipts, meal planning, QR sharing
- Workout logging with exercise library, custom exercises, sets/reps tracking
- Medical records: medications, doctor sessions, contacts, mental health
- Daily habit tracking with 7-day view and streaks
- To-do lists with categories and due dates
- AI assistant (floating chat panel using Anthropic API, persistent memory via `ai_memory` table)
- Dark mode toggle
- PWA support (installable, standalone mode)
- Responsive design (desktop sidebar, mobile hamburger menu)

## version numbering

- Current: **v4.25** (green badge in sidebar footer and About page)
- Bumped on every code change (minor version increment)
- Service worker cache key matches version (e.g., `cache-v4-12`)

**Version locations to update on every change:**
1. CLAUDE.md — `Current: **v4.XX**` (this line)
2. index.html — `<div class="version-badge">Cath Hub v4.XX</div>` (line ~580, main heading)
3. index.html — `<div style="...">v4.XX</div>` — 3 instances in sidebar, mobile bar, and About page (use sed: `sed -i 's/v4\.OLD/v4.NEW/g'`)
- Update `CLAUDE.md` end-of-session checklist to confirm version is bumped

## model selection guidance

When working with Claude Code:

- **Opus 4.6** — Complex architecture decisions, major refactors, multi-file changes, debugging tricky bugs
- **Sonnet 4.6** — Feature implementation, moderate changes, code generation
- **Haiku 4.5** — Quick fixes, small edits, explanations (fast + cheap, good for iteration)

This project uses Haiku by default for speed and cost. Escalate to Sonnet for feature work, Opus for architecture.

## tips for cheaper sessions

Make Claude Code work harder:

- **Be specific.** Instead of "fix the shopping list," say: "In `index.html` line 1234, the `amAddItem()` function is not saving to Supabase. Only change the function to use `sb.from('shopping_items').insert()`."
- **Reference script blocks.** Use line numbers and function names: "Update the `zbTab()` function starting at line 5865 to fix the Rhythm Cards tab."
- **Say "only change X."** Limits scope, reduces token waste.
- **Reference CLAUDE.md.** "As noted in CLAUDE.md, use filter pills instead of dropdowns" — no need to re-explain.
- **Paste error messages.** Stack traces are cheap context.

## limitations

- **No SQL on Supabase.** Claude Code cannot execute SQL directly. Provide copy-paste SQL statements for you to run in Supabase dashboard.
- **No OneDrive/SharePoint.** Cannot access cloud file storage. Use GitHub or local files.
- **No Supabase dashboard access.** Cannot browse tables or run queries live. Must be given table schema or query results.
- **Service worker cache must be bumped.** Browser cache won't clear automatically. Always increment version in cache key.
- **GitHub Pages deploy lag.** Push to main → 1–2 minutes until changes are live.

## end-of-session checklist

Before finishing:

- [ ] All code changes pushed to main
- [ ] Version bumped in `CLAUDE.md` and `index.html` (sidebar footer)
- [ ] Service worker cache key matches version (e.g., `cache-v4-9`)
- [ ] SQL queries provided as copy-paste (if applicable)
- [ ] CLAUDE.md updated with any new limitations or architecture changes
- [ ] About page updated with new tech stack or costs (if applicable)
- [ ] No open branches or PRs
- [ ] No uncommitted changes

## development notes

- All styling uses `!important` due to `#cathHub` scope reset
- Supabase client initialized with public anon key
- No build step required — pure HTML/CSS/JS
- Deploy via GitHub Pages (push main → live in 1–2 minutes)
- Service worker handles offline caching and install prompts
