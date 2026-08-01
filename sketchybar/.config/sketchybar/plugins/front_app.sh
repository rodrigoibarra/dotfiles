#!/usr/bin/env bash
# ~/.config/sketchybar/plugins/front_app.sh
source "$HOME/.config/sketchybar/colors.sh"

# $INFO is populated automatically by sketchybar for front_app_switched.
# On the initial config load there's no event yet, so fall back to asking
# System Events directly for the current frontmost app.
APP="$INFO"
if [ -z "$APP" ]; then
  APP="$(osascript -e 'tell application "System Events" to get name of first application process whose frontmost is true' 2>/dev/null)"
fi

sketchybar --set front_app label="${APP:-Desktop}" label.color="$TEXT_COLOR"
