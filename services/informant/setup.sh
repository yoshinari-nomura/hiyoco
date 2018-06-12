#!/bin/sh

SH_PATH=$(dirname $0)

echo -n YOUR_SLACK_TOKEN:
read token
echo -n CHANNEL_NAME:
read channel
echo -n DISPLAY_BOT_NAME:
read name
sed -e "s/<YOUR_SLACK_TOKEN>/${token}/g" $SH_PATH/settings.yml.sample | sed -e "s/<CHANNEL>/${channel}/g" | sed -e "s/<USER_NAME>/${name}/g" > $SH_PATH/settings.yml
