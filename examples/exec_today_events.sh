#!/bin/sh

while true; do
    ../services/calendar_watcher/exe/calendar_watcher today_events;
    sleep 60;
done
