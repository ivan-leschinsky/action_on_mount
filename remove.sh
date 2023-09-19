#!/bin/bash

FILE="$HOME/Library/LaunchAgents/action_on_mount.plist"

if test -f "$FILE"
then
  launchctl unload $FILE
  rm $FILE
else
  echo "$FILE alredy removed."
fi
