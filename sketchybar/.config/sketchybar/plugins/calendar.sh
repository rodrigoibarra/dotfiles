#!/usr/bin/env bash
# ~/.config/sketchybar/plugins/calendar.sh
# Shows the next appointment (or the one in progress) for today.
# Needs: brew install ical-buddy
source "$HOME/.config/sketchybar/colors.sh"

# Same minimal-PATH issue as the other plugins — icalBuddy lives in Homebrew's bin.
export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"

if ! command -v icalBuddy >/dev/null 2>&1; then
  sketchybar --set calendar label="no icalBuddy" label.color="$RED"
  exit 0
fi

NOW="$(date '+%H:%M')"

# One line per event: "HH:MM - HH:MM Title"
EVENT="$(icalBuddy -po "datetime,title" -tf "%H:%M" -df "" -nc -ea \
  -eep "location,notes,attendees,url,image" eventsToday 2>/dev/null \
  | sed -E 's/^• *//' \
  | awk -v now="$NOW" '
      {
        end = $3
        if (end !~ /^[0-9]{2}:[0-9]{2}$/ || end >= now) { print; exit }
      }')"

if [ -z "$EVENT" ]; then
  sketchybar --set calendar label="No events" label.color="$TEXT_COLOR"
else
  sketchybar --set calendar label="$EVENT" label.color="$TEXT_COLOR"
fi
