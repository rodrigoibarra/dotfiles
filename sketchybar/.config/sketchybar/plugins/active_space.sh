#!/usr/bin/env bash
# ~/.config/sketchybar/plugins/active_space.sh
source "$HOME/.config/sketchybar/colors.sh"

# The sketchybar daemon runs with a minimal PATH that doesn't include
# Homebrew's bin dirs, so `aerospace` isn't found unless we add them here.
export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"

WORKSPACE="$(aerospace list-workspaces --focused 2>/dev/null)"

sketchybar --set active_space label="${WORKSPACE:-?}" label.color="$TEAL"
