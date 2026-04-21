-- Delete specific weekly_items, keeping only items 5-9
-- User: Cath Baker (ae560260-5fab-4b00-9d3e-00d982f97de7)

-- Preview what will be deleted:
SELECT id, name FROM weekly_items
WHERE user_id = 'ae560260-5fab-4b00-9d3e-00d982f97de7'
  AND name IN (
    'Andrew — Life and admin conversation',
    'Andrew — Relationship check-in',
    'Coach4U cash flow — Review',
    'Personal cash flow — Review'
  );

-- If that looks right, run the delete:
DELETE FROM weekly_items
WHERE user_id = 'ae560260-5fab-4b00-9d3e-00d982f97de7'
  AND name IN (
    'Andrew — Life and admin conversation',
    'Andrew — Relationship check-in',
    'Coach4U cash flow — Review',
    'Personal cash flow — Review'
  );

-- Verify remaining items (should be the 5 you want to keep):
SELECT id, name FROM weekly_items
WHERE user_id = 'ae560260-5fab-4b00-9d3e-00d982f97de7'
ORDER BY name;
