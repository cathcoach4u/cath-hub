#!/bin/bash
# Cath Hub session-start status banner.
# Prints a compact 4-line snapshot so context is obvious without reading git logs.
set -e
cd "$CLAUDE_PROJECT_DIR" 2>/dev/null || exit 0

BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "?")
VERSION=$(grep -oE 'v7\.[0-9]+' CLAUDE.md 2>/dev/null | head -1 || echo "?")
DIRTY=$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')
LAST_COMMIT=$(git log -1 --pretty=format:'%s' 2>/dev/null || echo "?")
AHEAD=$(git rev-list --count "@{u}..HEAD" 2>/dev/null || echo "0")
BEHIND=$(git rev-list --count "HEAD..@{u}" 2>/dev/null || echo "0")

echo "── Cath Hub ──────────────────────────────"
echo " branch:  $BRANCH ($AHEAD ahead, $BEHIND behind)"
echo " version: $VERSION"
if [ "$DIRTY" = "0" ]; then
  echo " tree:    clean ✓"
else
  echo " tree:    $DIRTY uncommitted change(s) — review before new work"
fi
echo " last:    $LAST_COMMIT"
echo "──────────────────────────────────────────"
