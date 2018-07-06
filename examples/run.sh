#!/bin/sh

./exec_today_events.sh |tee >(ruby filter_before_15minutes.rb | ruby filter_not_out_yet.rb |bundle exec ruby post_event_to_sounder.rb 172.21.50.8 50050) >(./filter_not_out_yet.rb | ./once_day.rb | bundle exec ruby post_event_to_informant.rb localhost 50051)
