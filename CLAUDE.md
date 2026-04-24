# CLAUDE.md - Cath Hub

## Working Style

- **No apologies.** Direct, action-oriented communication. Tell it straight.
- **Push to main.** All work goes to main branch (not feature branches).
- **Full coder approach.** You're here to code, not chat. Minimal explanation, maximum work.
- **Australian English.** Spelling, dates as DD/MM/YYYY, currency as AUD $.
- **No uppercase headings.** Use lowercase for all section headers (except titles).
- **Filter pills, not dropdowns.** Prefer horizontal filter pill buttons over dropdown menus.
- **Collapsible sections.** Default sections to collapsed when space is tight.
- **SQL always in chat.** When providing SQL (migrations, updates, deletes), paste it as a code block directly in the chat response. Do not only write it to a `.sql` file — the user runs it from chat. Optional: also save to a file for future reference.

## Project Overview

Cath Hub is a personal health & household management PWA built with vanilla HTML/CSS/JS (no frameworks), Supabase backend, hosted on GitHub Pages. Repository: cathcoach4u/personal-cath-hub.

**Timezone:** Australia/Sydney (AEST/AEDT). Always use Sydney time.

## User Information

- **Name:** Cath Baker
- **User ID:** `ae560260-5fab-4b00-9d3e-00d982f97de7` (use for SQL scripts and database operations)

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

1. **dashboard** (`ch-home`) — overview cards, quick stats, navigation
2. **to-do** (`ch-todo`) — personal tasks with categories and due dates (grouped by category with headers)
3. **workout buddy** (`ch-workout`) — exercise tracking with sets/reps, custom exercises, session history
4. **medical** (`ch-medical`) — medications, doctor sessions, mental health notes
5. **tracking medication** (`ch-habits`) — daily medication log with completion tracking
6. **my habits** (`ch-habits2`) — rhythm cards (daily, weekly, fortnightly, 6-monthly, annual) with collapsible weekday/weekend sections
7. **habit history** (`ch-habit-history`) — historical logs for all habit tracking
8. **zone buddy** (`ch-zones`) — zone management &amp; tracking
9. **travel** (`ch-travel`) — travel planning
10. **about** (`ch-about`) — app info, tech stack, database, persistent memory, key links

## standalone pages

- `morning.html` — morning medication auto-recording (Vyvanse, Valtrex, Levothyroxine)
- `todo.html` — standalone personal to-do list with categories and due dates (grouped by category with headers)
- `workout.html` — workout logging with exercise library
- `ai.html` — floating AI assistant (separate app, can manipulate to-do via API tools)

**Note:** Both `index.html` (ch-todo screen) and `todo.html` have separate to-do implementations. Always ask which one to modify when ambiguous.

## database schema

### shopping & household
- `shopping_items` — name, category, store, checked, created_at (no user_id)
- `master_items` — name, category, store, family_member, last_price, user_id
- `meal_plans` — day_index, meal data, user_id
- `personal_todos` — task, done, category, due_date, created_at, user_id
- `fiona_tasks` — task, done, created_at

### medical & health
- `medications` — name, dose, schedule, purpose (no user_id)
- `medical_sessions` — date, duration, plan, practitioner, user_id
- `mental_health_sessions` — date, mood, notes, user_id
- `habit_meds` — id, name, freq ['daily', 'asneeded'] (shared, no user_id)
- `habit_logs` — med_id, date, created_at, note (no user_id; `note` stores as-needed med brand/details and weekly dose e.g. Mounjaro)

### rhythms (daily, weekly, fortnightly, 6-monthly, annual)
- `daily_items` — id, name, section ['morning','midday','evening'], day_type ['weekday','weekend'], user_id
- `daily_logs` — item_id, log_date, user_id
- `weekly_items` — id, name, user_id
- `weekly_logs` — item_id, logged_date, user_id
- `fortnightly_items` — id, name, user_id, created_at
- `fortnightly_logs` — item_id, logged_date, user_id
- `sixmonthly_items` — id, name, user_id, created_at
- `sixmonthly_logs` — item_id, logged_date, user_id
- `annual_items` — id, name, user_id, created_at
- `annual_logs` — item_id, logged_date, user_id

### fitness
- `workout_sessions` — date, duration, type, notes, user_id
- `workout_exercises` — session_id, name, sets, reps, weight, user_id
- `workout_sets` — exercise_id, set_num, reps, weight, user_id

### shopping receipts
- `receipts` — store, receipt_date, total, uploaded_at, user_id
- `receipt_items` — item_name, price, receipt_id, user_id

### ai & memory
- `ai_memory` — fact, created_at, user_id (persistent memory for AI chat)

### storage
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

- Supabase authentication with email/password
- Dashboard with quick stats and navigation cards
- To-do lists with categories and due dates (grouped by category with headers)
- Workout logging with exercise library, custom exercises, sets/reps tracking, session history
- Medical records: medications, doctor sessions, mental health notes
- Medication tracking with daily completion logging
- Habit rhythm cards: daily (weekday/weekend), weekly, fortnightly, 6-monthly, annual with custom item management
- Habit history with detailed logs
- Zone buddy for zone management and tracking
- Travel planning
- AI assistant (floating chat panel using Anthropic API, persistent memory via `ai_memory` table)
- Dark mode toggle
- PWA support (installable, standalone mode)
- Responsive design (desktop sidebar, mobile hamburger menu)

## version numbering

- Current: **v7.51** (green badge in sidebar footer and About page)
- Bumped on every code change (minor version increment)
- No service worker in Cath Hub (GitHub Pages handles caching). If one is added, keep its cache name in sync with the version.

**2 places to update version (Baker Hub convention):**

1. **Mobile top bar badge** (`index.html`) — always visible, top-right of teal bar
   - Style: 10px / 700 / white text / `background: rgba(255,255,255,0.2)` / `padding: 2px 8px` / `border-radius: 5px`
2. **Sidebar header badge** (`index.html`) — desktop sidebar, right of "Cath Hub" h1
   - Style: 11px / 700 / `color: rgba(255,255,255,0.7)` / `background: rgba(255,255,255,0.15)` / `padding: 3px 10px` / `border-radius: 6px`
3. **CLAUDE.md** — `Current: **v7.XX**` line

Date badge (mobile top bar) matches Baker Hub: 13px / 700 / white / `white-space: nowrap`, format `toLocaleDateString('en-AU', { weekday: 'short', day: 'numeric', month: 'short', year: 'numeric' })` → "Mon, 24 Apr 2026". Auto-updates from device date.

**One-command bump:**
```
OLD="v7.XX" NEW="v7.YY" && sed -i "s/${OLD}/${NEW}/g" index.html CLAUDE.md && git add -A && git commit -m "Bump version to ${NEW}" && git push
```

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

## start-of-session checklist

When reconnecting (each new session):

- [ ] Read this CLAUDE.md file to refresh all procedures
- [ ] Check current version number before any version bumps
- [ ] Read relevant memory sections (e.g., "version numbering") before acting on those tasks
- [ ] Review end-of-session checklist to understand what was last done

**Critical:** Do NOT assume memory from previous sessions. Always read CLAUDE.md first.

## end-of-session checklist

Before finishing:

- [x] All code changes pushed to main
- [x] Version bumped in `CLAUDE.md` and `index.html` (sidebar footer) — v7.17
- [x] Service worker cache key matches version — N/A (no service worker)
- [x] SQL queries provided as copy-paste (if applicable) — daily-items-setup.sql documented
- [x] CLAUDE.md updated with any new limitations or architecture changes — user_id filtering fixes documented
- [x] About page audited — all current (v7.17, infrastructure, AI services, tech stack, screens, database, features all listed)
- [x] Page titles standardised to "Cath Hub" across all HTML files
- [x] No open branches or PRs (feature branch deleted)
- [x] No uncommitted changes
- [x] Feature branches cleaned up

## development notes

- All styling uses `!important` due to `#cathHub` scope reset
- Supabase client initialized with public anon key
- No build step required — pure HTML/CSS/JS
- Deploy via GitHub Pages (push main → live in 1–2 minutes)
- Service worker: mentioned in docs but not yet implemented (file doesn't exist)

## session notes (v7.17)

**Changes made this session:**
- ✅ To-do lists grouped by category with headers (both dashboard and standalone)
- ✅ Fixed My Habits deletion bug: added user_id filtering to all render functions (daily, weekly, fortnightly, 6-monthly, annual)
- ✅ Fixed dashboard daily items: added user_id & day_type filtering to show only today's items
- ✅ Fixed dashboard todos & fortnightly items: added user_id filtering
- ✅ Standardised all page titles to "Cath Hub" (except ai.html which is "Cath AI")
- ✅ Documented all to-do implementations in CLAUDE.md with clarification practice
- ✅ Daily items now feed correctly into dashboard quick wins

**Important fixes:**
- Render functions were fetching ALL items (no user_id filter) — now filtered by user_id
- Dashboard was showing items for all day types — now filters by weekday/weekend
- Deletion appeared to fail because other users' items re-appeared — now isolated per user

**Multiple implementations (ask which one):**
- Dashboard to-do (`ch-todo` in index.html) — grouped by category
- Standalone to-do (`todo.html`) — grouped by category
- AI assistant (`ai.html`) — separate app with to-do API tools

**Ready for next session:**
- All code on main (v7.17)
- No open branches or PRs (feature branch cleaned up)
- No uncommitted changes
- CLAUDE.md fully documented with all fixes
- Daily items setup documented (DAILY_ITEMS_UPDATE.md, daily-items-setup.sql)
- User ID: `ae560260-5fab-4b00-9d3e-00d982f97de7`
