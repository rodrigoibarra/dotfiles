#!/usr/bin/env sh
# ~/.config/sketchybar/items/active_space.sh
# Active AeroSpace workspace name only — no picker, no click targets.

sketchybar --add event aerospace_workspace_change

sketchybar --add item active_space left \
  --set active_space \
    icon=$'' \
    icon.color="$TEXT_COLOR" \
    label.color="$TEXT_COLOR" \
    update_freq=5 \
    script="$PLUGIN_DIR/active_space.sh" \
  --subscribe active_space aerospace_workspace_change front_app_switched

# update_freq above self-heals within 5s even if this seed call runs before
# sketchybar's own IPC socket is ready to accept a command from itself.
"$PLUGIN_DIR/active_space.sh" &
