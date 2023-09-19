#!/bin/bash

newvol=$(find /Volumes -maxdepth 1 | grep -v '^/Volumes$' | grep -v '.timemachine' | grep -v 'Macintosh HD' | grep -v 'com.apple.TimeMachine.localsnapshots' | grep -v 'Volumes/Recovery')

function sendText {
  text=$1
  curl -s -X POST "https://api.telegram.org/bot$MOUNT_BOT_TOKEN/sendMessage" -d parse_mode=HTML -d "chat_id=$MOUNT_USER_TO_SEND" -d "text=$text"
}

if test -z "$newvol"
then
  sendText "Last disk unmounted"
else
  sendText "<b>Disks mounted:</b>%0A$newvol"
fi
