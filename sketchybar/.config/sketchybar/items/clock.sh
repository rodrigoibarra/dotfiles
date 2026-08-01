#!/usr/bin/env sh
# ~/.config/sketchybar/items/clock.sh

sketchybar --add item clock right \
  --set clock \
    icon=$'' \
    icon.color="$TEXT_COLOR" \
    label.font="Hack Nerd Font:Semibold:12.0" \
    label.width=40 \
    label.align=right \
    update_freq=30 \
    script="$PLUGIN_DIR/clock.sh"
