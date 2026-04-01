# CLAUDE.md - Cath Hub

## Project Overview

Cath Hub is a personal health & household management PWA built with vanilla HTML/CSS/JS (no frameworks), Supabase backend, hosted on GitHub Pages. Repository: cathcoach4u/personal-cath-hub.

## Architecture

- Single-page app: `index.html` contains all screens with sidebar navigation
- Standalone utility pages: `fiona.html`, `morning.html`, `shopping.html`, `todo.html`, `workout.html`
- Login via Supabase Auth (email/password) with optional PIN lock
- Navigation: `chNav(screenName, btn)` function switches screens
- All CSS is inline in `<style>` tags, scoped with `#cathHub` prefix and `!important`
- Dark mode toggle available
- No build step required - pure HTML/CSS/JS
- Deploy via GitHub Pages

## Screens (in index.html)

1. **Dashboard** (`ch-home`) - overview cards, shopping summary, recent receipts
2. **To-Do** (`ch-todo`) - personal tasks with categories and due dates
3. **AisleMate** (`ch-aislemate`) - shopping system with 9 subscreens (weekly list, master items, receipts, meal plan, family members, QR share, settings)
4. **Workout Log** (`ch-workout`) - exercise tracking with sets/reps, bottom-sheet picker
5. **Medical** (`ch-medical`) - medications, sessions, contacts, mental health
6. **My Habits** (`ch-habits`) - daily habit tracking with streaks
7. **Travel** (`ch-travel`) - travel planning
8. **Home** (`ch-hometab`) - household management
9. **About** (`ch-about`) - app info, built-with, stack, features, Supabase tables

## Standalone Pages

- `fiona.html` - Fiona's cleaning/sorting task list
- `morning.html` - Morning medication auto-recording (Vyvanse, Valtrex, Levothyroxine)
- `shopping.html` - Quick shopping list with categories and store tagging
- `todo.html` - Personal to-do list with categories and due dates
- `workout.html` - Workout logging with exercise library

## Supabase Tables

- `shopping_items` (name, category, store, checked, created_at)
- `personal_todos` (task, done, category, due_date, created_at)
- `fiona_tasks` (task, done, created_at)
- `habit_meds` (id, name, freq ['daily', 'asneeded'])
- `habit_logs` (med_id, date, created_at)
- `medications` (name, dose, schedule, purpose)
- `medical_sessions` (date, duration, plan, practitioner)
- `master_items` (name, category, store, family_member, last_price)
- `receipts` (store, receipt_date, total, uploaded_at)
- `receipt_items` (item_name, price, receipt_id)
- `meal_plans` (day_index, meal data)
- `ai_memory` (fact, created_at)
- Storage bucket: `receipts` (for receipt images/PDFs)

## Design System

### Colors

- Top bar / sidebar / mobile nav: teal `#0d9488`
- Active nav highlight: `rgba(59,130,246,0.3)` with `#3b82f6` border
- Background: `#f8fafc`
- Cards: white with `#e2e8f0` border, 10px radius
- Text: `#1e293b` (headings), `#64748b` (labels), `#94a3b8` (meta)

### Typography

- Font: `'Segoe UI', system-ui, -apple-system, sans-serif`
- Headings: 22px/700, Section labels: 14px/700, Body: 12-13px

### Layout

- Desktop: 240px teal sidebar + white content area
- Mobile (under 768px): Sticky teal top bar with hamburger dropdown menu
- Cards: white, 1px border `#e2e8f0`, 10px radius, 16px padding
- Buttons: teal/dark background, white text, 7px radius
- Badges/tags: 9-10px font, pill shape, colour-coded backgrounds
- Tables: 10px uppercase headers, 12px body, hover highlight `#f8fafc`

### PWA

- `manifest.json` with standalone display, teal theme, SVG icons with white "C"

## Features

- Supabase authentication with email/password + PIN lock
- Dashboard with quick stats and navigation cards
- Shopping list management (AisleMate) with categories, stores, family members, master items, receipts, meal planning, QR sharing
- Workout logging with exercise library, custom exercises, sets/reps tracking
- Medical records: medications, doctor sessions, contacts, mental health
- Daily habit tracking with 7-day view and streaks
- To-do lists with categories and due dates
- AI assistant (floating chat panel using Anthropic API)
- Dark mode
- PWA support (installable, standalone mode)
- Responsive design (desktop sidebar, mobile hamburger menu)

## Development Notes

- All styling uses `!important` due to `#cathHub` scope reset
- Supabase client initialized with public anon key
- No build step required - pure HTML/CSS/JS
- Deploy via GitHub Pages
