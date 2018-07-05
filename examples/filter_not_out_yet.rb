#!/usr/bin/env ruby
# coding: utf-8
require "./event.rb"

def filter(events, &block)
  events_not_out_yet = EventCollection.new
  events.each do |ev|
    events_not_out_yet << ev if yield(ev) 
  end
  return events_not_out_yet
end

seen = {}
while json = gets
  events = EventCollection.from_json(json.chomp)
  events_not_out_yet = filter(events) do |ev| 
    unseen = !seen[ev.to_s]
    seen[ev.to_s] = true
    unseen 
  end
  p events_not_out_yet.to_json
end
