# Daily Items Update Instructions

## Overview
This update replaces your weekday morning daily items with a new curated morning routine.

## New Morning Weekday Items
The following items have been added to replace your existing weekday morning list:
1. Mouthguard - cleaned
2. Eat anchor - eat breakfast
3. Open Blinds
4. Hydration - full glass to start the day
5. Clean teeth - 2 mins

## How to Apply Changes

### Step 1: Get Your User ID
1. Log in to your Supabase dashboard
2. Go to Authentication > Users
3. Find your user and copy your User ID (it's a UUID)

### Step 2: Run the SQL Script
1. Open the SQL Editor in Supabase
2. Copy the contents of `daily-items-setup.sql`
3. Find the line with `'YOUR_USER_ID'` and replace it with your actual User ID
4. Run the script

### Example
Before:
```sql
INSERT INTO daily_items (id, name, section, day_type, user_id, created_at)
VALUES
  ('morning_wd_01_...', 'Mouthguard - cleaned', 'morning', 'weekday', 'YOUR_USER_ID', now()),
```

After:
```sql
INSERT INTO daily_items (id, name, section, day_type, user_id, created_at)
VALUES
  ('morning_wd_01_...', 'Mouthguard - cleaned', 'morning', 'weekday', 'd1234567-89ab-cdef-0123-456789abcdef', now()),
```

## What the Script Does
- Deletes all existing weekday morning items
- Inserts 5 new morning routine items in the correct order

## Collapsible Sections
The daily items sections (Morning, Midday, Evening) on the "My Habits" screen are already collapsible using the arrow buttons (▶).

## Dashboard Display
Daily items are displayed on the dashboard and automatically show only incomplete items for the current day type (weekday/weekend).
