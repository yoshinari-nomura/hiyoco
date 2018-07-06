#!/usr/bin/env ruby

require "./event.rb"

def filter(events, &block)
  filtered = EventCollection.new
  events.each do |ev|
    filtered << ev if yield(ev)
  end
  return filtered
end

def before_15minutes_events(events)
  filtered = filter(events) do |ev|
    lead_time = ev.start_time.to_time - Time.now.localtime
    (0 < lead_time && lead_time < 15*60)
  end
  
  filtered.to_json
end

while json = gets
  events = EventCollection.from_json(json.chomp)
  puts before_15minutes_events(events)
  STDOUT.flush
end
