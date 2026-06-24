#!/bin/bash
TITLE=$(nowplaying-cli get title 2>/dev/null)
ARTIST=$(nowplaying-cli get artist 2>/dev/null)
if [ -n "$TITLE" ] && [ "$TITLE" != "null" ]; then
  echo "$ARTIST - $TITLE"
fi
