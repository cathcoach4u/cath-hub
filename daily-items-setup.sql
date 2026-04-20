-- Delete all existing weekday morning items
DELETE FROM daily_items WHERE section = 'morning' AND day_type = 'weekday';

-- Insert new weekday morning items
-- Replace 'YOUR_USER_ID' with your actual user ID from the auth.users table
INSERT INTO daily_items (id, name, section, day_type, user_id, created_at)
VALUES
  ('morning_wd_01_' || to_char(now(), 'YYYYMMDDHHmmss'), 'Mouthguard - cleaned', 'morning', 'weekday', 'YOUR_USER_ID', now()),
  ('morning_wd_02_' || to_char(now(), 'YYYYMMDDHHmmss'), 'Eat anchor - eat breakfast', 'morning', 'weekday', 'YOUR_USER_ID', now()),
  ('morning_wd_03_' || to_char(now(), 'YYYYMMDDHHmmss'), 'Open Blinds', 'morning', 'weekday', 'YOUR_USER_ID', now()),
  ('morning_wd_04_' || to_char(now(), 'YYYYMMDDHHmmss'), 'Hydration - full glass to start the day', 'morning', 'weekday', 'YOUR_USER_ID', now()),
  ('morning_wd_05_' || to_char(now(), 'YYYYMMDDHHmmss'), 'Clean teeth - 2 mins', 'morning', 'weekday', 'YOUR_USER_ID', now());
