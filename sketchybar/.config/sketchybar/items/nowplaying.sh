#!/usr/bin/env sh
# ~/.config/sketchybar/items/nowplaying.sh
# Currently playing media, via nowplaying-cli.
# Requires: brew install nowplaying-cli

sketchybar --add item nowplaying right \
  --set nowplaying \
    icon=$'' \
    icon.color="$TEAL" \
    label.color="$TEXT_COLOR" \
    label.max_chars=32 \
    update_freq=5 \
    script="$PLUGIN_DIR/nowplaying.sh"
