-- Claim orphaned rhythm items (rows with NULL user_id) for Cath Baker
-- Run in Supabase SQL Editor. User ID: ae560260-5fab-4b00-9d3e-00d982f97de7

-- Preview first: see what's about to change
SELECT 'weekly_items' AS table_name, COUNT(*) AS orphaned_count FROM weekly_items WHERE user_id IS NULL
UNION ALL
SELECT 'sixmonthly_items', COUNT(*) FROM sixmonthly_items WHERE user_id IS NULL
UNION ALL
SELECT 'annual_items', COUNT(*) FROM annual_items WHERE user_id IS NULL
UNION ALL
SELECT 'fortnightly_items', COUNT(*) FROM fortnightly_items WHERE user_id IS NULL;

-- If the counts look right, run the updates:
UPDATE weekly_items      SET user_id = 'ae560260-5fab-4b00-9d3e-00d982f97de7' WHERE user_id IS NULL;
UPDATE sixmonthly_items  SET user_id = 'ae560260-5fab-4b00-9d3e-00d982f97de7' WHERE user_id IS NULL;
UPDATE annual_items      SET user_id = 'ae560260-5fab-4b00-9d3e-00d982f97de7' WHERE user_id IS NULL;
UPDATE fortnightly_items SET user_id = 'ae560260-5fab-4b00-9d3e-00d982f97de7' WHERE user_id IS NULL;

-- Verify: all items now have your user_id
SELECT 'weekly_items' AS table_name, COUNT(*) AS my_items FROM weekly_items WHERE user_id = 'ae560260-5fab-4b00-9d3e-00d982f97de7'
UNION ALL
SELECT 'sixmonthly_items', COUNT(*) FROM sixmonthly_items WHERE user_id = 'ae560260-5fab-4b00-9d3e-00d982f97de7'
UNION ALL
SELECT 'annual_items', COUNT(*) FROM annual_items WHERE user_id = 'ae560260-5fab-4b00-9d3e-00d982f97de7'
UNION ALL
SELECT 'fortnightly_items', COUNT(*) FROM fortnightly_items WHERE user_id = 'ae560260-5fab-4b00-9d3e-00d982f97de7';
