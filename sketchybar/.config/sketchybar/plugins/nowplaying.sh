#!/usr/bin/env bash
# ~/.config/sketchybar/plugins/nowplaying.sh
# Needs: brew install nowplaying-cli
source "$HOME/.config/sketchybar/colors.sh"

# Same minimal-PATH issue as the other plugins — nowplaying-cli lives in Homebrew's bin.
export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"

if ! command -v nowplaying-cli >/dev/null 2>&1; then
  sketchybar --set nowplaying label="" icon.drawing=off
  exit 0
fi

RATE="$(nowplaying-cli get playbackRate 2>/dev/null)"

if [ "$RATE" = "1" ]; then
  TITLE="$(nowplaying-cli get title 2>/dev/null)"
  ARTIST="$(nowplaying-cli get artist 2>/dev/null)"
  LABEL="$TITLE"
  [ -n "$ARTIST" ] && LABEL="$TITLE — $ARTIST"

  if [ -n "$TITLE" ]; then
    sketchybar --set nowplaying icon.drawing=on label="$LABEL" label.color="$TEXT_COLOR"
  else
    sketchybar --set nowplaying label="" icon.drawing=off
  fi
else
  sketchybar --set nowplaying label="" icon.drawing=off
fi
