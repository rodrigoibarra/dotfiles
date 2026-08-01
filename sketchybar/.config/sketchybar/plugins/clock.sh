#!/usr/bin/env bash
# ~/.config/sketchybar/plugins/clock.sh
source "$HOME/.config/sketchybar/colors.sh"

sketchybar --set clock label="$(date '+%H:%M')" label.color="$TEXT_COLOR"
