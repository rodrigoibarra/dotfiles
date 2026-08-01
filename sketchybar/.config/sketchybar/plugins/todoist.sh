#!/usr/bin/env bash
# ~/.config/sketchybar/plugins/todoist.sh
# Shows the highest-priority task due today or overdue.
# Needs: curl, jq, and a token file at ~/.config/sketchybar/todoist.token
source "$HOME/.config/sketchybar/colors.sh"

# Same minimal-PATH issue as the other plugins — jq lives in Homebrew's bin.
export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"

TOKEN_FILE="$HOME/.config/sketchybar/todoist.token"

if [ ! -f "$TOKEN_FILE" ]; then
  sketchybar --set todoist label="no token" label.color="$RED"
  exit 0
fi

TOKEN="$(cat "$TOKEN_FILE")"

RESPONSE="$(curl -s --max-time 5 \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.todoist.com/rest/v2/tasks?filter=today%7Coverdue")"

TASK="$(echo "$RESPONSE" | jq -r '
  sort_by(-.priority) | .[0].content // empty' 2>/dev/null)"

if [ -z "$TASK" ]; then
  sketchybar --set todoist label="All clear" label.color="$TEXT_COLOR"
else
  sketchybar --set todoist label="$TASK" label.color="$TEXT_COLOR"
fi
