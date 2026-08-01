#!/usr/bin/env sh
# ~/.config/sketchybar/items/calendar.sh
# Next (or current) appointment today, via icalBuddy.
# Requires: brew install ical-buddy

sketchybar --add item calendar right \
  --set calendar \
    icon=$'' \
    icon.color="$RED" \
    label.color="$TEXT_COLOR" \
    label.max_chars=28 \
    update_freq=60 \
    script="$PLUGIN_DIR/calendar.sh" \
  --subscribe calendar system_woke
