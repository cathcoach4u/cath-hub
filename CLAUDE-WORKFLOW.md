# Claude Development Workflow

## CRITICAL PROCESS - FOLLOW EVERY TIME

### 1. Make Changes
- Read the file first
- Make edits using Edit tool
- Verify changes are in the file

### 2. Commit
- Use: `git add [files]`
- Use: `git commit -m "Clear message describing change"`
- Verify commit succeeded

### 3. Push to Main (MANDATORY - DO NOT SKIP)
- Use: `git push origin main`
- Verify push succeeded
- Changes now go live to: https://cathcoach4u.github.io/personal-cath-hub/

### 4. Ask User to Verify
- Tell user to hard refresh the live site
- Ask them to confirm the change appears
- **DO NOT say "done" until user confirms it's live**

### 5. Only Mark Complete After Confirmation
- Once user confirms they see the change on the live site
- Then mark the task as complete

## Key Rules
- Push to main is NOT optional - it's part of every change
- Never say "done" without user verification
- Changes deploy automatically after push to origin main
- GitHub Pages handles the deployment - just push and it goes live

## Git Remote
- Origin: `http://127.0.0.1:XXXX/git/cathcoach4u/personal-cath-hub`
- This is the correct deployment remote
- Push to `origin main` = changes go live

## Remember
If you skip any step, the user will be frustrated because changes won't appear. Follow this exactly every single time.
