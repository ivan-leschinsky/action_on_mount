#!/bin/bash
run_file_name="${1:-action_on_mount.sh}"
name="Custom action on Mount"
tmp_filename="tmp.plist"
final_filepath="$HOME/Library/LaunchAgents/action_on_mount.plist"
cp action_on_mount.plist $tmp_filename

sed -i '' "s!LOCAL_PATH_HERE!$PWD!" $tmp_filename
sed -i '' "s!LOCAL_NAME_HERE!$name!" $tmp_filename
sed -i '' "s!LOCAL_RUN_FILE_NAME_HERE!$run_file_name!" $tmp_filename

# Setup telegram bot variables
if [ -n "$MOUNT_BOT_TOKEN" ]; then
  sed -i '' "s!MOUNT_BOT_TOKEN_VALUE!$MOUNT_BOT_TOKEN!" $tmp_filename
else
  echo "Skipping MOUNT_BOT_TOKEN setup, as it is blank."
fi
if [ -n "$MOUNT_USER_TO_SEND" ]; then
  sed -i '' "s!MOUNT_USER_TO_SEND_VALUE!$MOUNT_USER_TO_SEND!" $tmp_filename
else
  echo "Skipping MOUNT_USER_TO_SEND setup, as it is blank."
fi

mv $tmp_filename $final_filepath
launchctl load $final_filepath
