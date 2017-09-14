#!/bin/sh

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/Safari.app"
dockutil --no-restart --add '' --type spacer --section apps --after Safari
dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/Applications/Atom.app"
dockutil --no-restart --add "/Applications/Sequel Pro.app"
dockutil --no-restart --add '' --type spacer --section apps --after Pro
dockutil --no-restart --add "/Applications/Microsoft Office 2011/Microsoft Excel.app"
dockutil --no-restart --add "/Applications/Microsoft Office 2011/Microsoft Word.app"
dockutil --no-restart --add '' --type spacer --section apps --after Word
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/Applications/Skype.app"
dockutil --no-restart --add "/Applications/iA Writer.app"

killall Dock

echo "Success! Dock is set."
