#!/usr/bin/env sh
# ~/.config/sketchybar/items/front_app.sh
# Active app name — left section.

sketchybar --add item front_app left \
  --set front_app \
    icon=$'' \
    icon.color="$TEAL" \
    label.color="$TEXT_COLOR" \
    update_freq=5 \
    script="$PLUGIN_DIR/front_app.sh" \
  --subscribe front_app front_app_switched

# update_freq above self-heals within 5s even if this seed call runs before
# sketchybar's own IPC socket is ready to accept a command from itself.
"$PLUGIN_DIR/front_app.sh" &
