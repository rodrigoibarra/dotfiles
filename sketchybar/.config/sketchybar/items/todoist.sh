#!/usr/bin/env sh
# ~/.config/sketchybar/items/todoist.sh
# Next Todoist task due today/overdue, highest priority first.
# Requires an API token saved at ~/.config/sketchybar/todoist.token
# (Todoist -> Settings -> Integrations -> Developer -> API token).

sketchybar --add item todoist right \
  --set todoist \
    icon=$'' \
    icon.color="$YELLOW" \
    label.color="$TEXT_COLOR" \
    label.max_chars=28 \
    update_freq=300 \
    script="$PLUGIN_DIR/todoist.sh" \
  --subscribe todoist system_woke
