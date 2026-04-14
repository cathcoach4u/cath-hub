-- Workout Tables Setup
-- Run these SQL statements in the Supabase SQL Editor

-- 1. Create workout_sessions table
CREATE TABLE IF NOT EXISTS workout_sessions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  date DATE NOT NULL,
  start_time TIMESTAMP WITH TIME ZONE NOT NULL,
  end_time TIMESTAMP WITH TIME ZONE NOT NULL,
  duration_minutes INTEGER NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(date)
);

-- 2. Create workout_exercises table
CREATE TABLE IF NOT EXISTS workout_exercises (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id UUID NOT NULL,
  name TEXT NOT NULL,
  type TEXT NOT NULL,
  target_label TEXT,
  notes TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  CONSTRAINT fk_session FOREIGN KEY (session_id) REFERENCES workout_sessions (id) ON DELETE CASCADE
);

-- 3. Create workout_sets table
CREATE TABLE IF NOT EXISTS workout_sets (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  exercise_id UUID NOT NULL,
  set_number INTEGER NOT NULL,
  weight NUMERIC(10, 2),
  reps TEXT,
  done BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  CONSTRAINT fk_exercise FOREIGN KEY (exercise_id) REFERENCES workout_exercises (id) ON DELETE CASCADE
);

-- Enable Row Level Security
ALTER TABLE workout_sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE workout_exercises ENABLE ROW LEVEL SECURITY;
ALTER TABLE workout_sets ENABLE ROW LEVEL SECURITY;

-- Create policies to allow public (unauthenticated) access
CREATE POLICY "Allow public insert on workout_sessions"
  ON workout_sessions FOR INSERT WITH CHECK (true);

CREATE POLICY "Allow public insert on workout_exercises"
  ON workout_exercises FOR INSERT WITH CHECK (true);

CREATE POLICY "Allow public insert on workout_sets"
  ON workout_sets FOR INSERT WITH CHECK (true);

CREATE POLICY "Allow public select on workout_sessions"
  ON workout_sessions FOR SELECT USING (true);

CREATE POLICY "Allow public select on workout_exercises"
  ON workout_exercises FOR SELECT USING (true);

CREATE POLICY "Allow public select on workout_sets"
  ON workout_sets FOR SELECT USING (true);

-- 4. Create gym_classes table
CREATE TABLE IF NOT EXISTS gym_classes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  date DATE NOT NULL,
  duration_minutes INTEGER,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable Row Level Security for gym_classes
ALTER TABLE gym_classes ENABLE ROW LEVEL SECURITY;

-- Create policies for gym_classes
CREATE POLICY "Allow public insert on gym_classes"
  ON gym_classes FOR INSERT WITH CHECK (true);

CREATE POLICY "Allow public select on gym_classes"
  ON gym_classes FOR SELECT USING (true);

CREATE POLICY "Allow public delete on gym_classes"
  ON gym_classes FOR DELETE USING (true);

-- Create indexes for better query performance
CREATE INDEX idx_workout_sessions_date ON workout_sessions(date DESC);
CREATE INDEX idx_workout_exercises_session ON workout_exercises(session_id);
CREATE INDEX idx_workout_sets_exercise ON workout_sets(exercise_id);
CREATE INDEX idx_gym_classes_date ON gym_classes(date DESC);
