#!/bin/sh

SH_PATH=$(dirname $0)

echo "Start setup for informant."
echo "Python library will be installed. Are you OK? [Y/n]"
read ANSWER

case $ANSWER in
    "" | "Y" | "y" | "yes" | "Yes" | "YES" ) pip install -r $SH_PATH/requirements/development.txt;;
    * ) exit 0;;
esac

echo "Start compile proto file."
$SH_PATH/compile_proto.sh
echo "Done"

echo "Set slack-token, post destination channel, and bot display name."
echo "You can get slack-token from following URL."
echo "https://api.slack.com/custom-integrations/legacy-tokens"

echo -n YOUR_SLACK_TOKEN:
read token
echo -n CHANNEL_NAME:
read channel
echo -n DISPLAY_BOT_NAME:
read name
sed -e "s/<YOUR_SLACK_TOKEN>/${token}/g" $SH_PATH/settings.yml.sample | sed -e "s/<CHANNEL>/${channel}/g" | sed -e "s/<USER_NAME>/${name}/g" > $SH_PATH/settings.yml
