$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'event'
require 'json'

require 'grpc'
require "hiyoco/calendar/event_pb"
require "hiyoco/informant/service_services_pb"

def post(msg)
  stub = Hiyoco::Informant::Informant::Stub.new("#{ARGV[0]}:#{ARGV[1]}", :this_channel_is_insecure)
  stub.say_event(Hiyoco::Calendar::Text.new(body: "#{msg}"))
end

while json = STDIN.gets
  events = EventCollection.from_json(json)
  msg = []
  msg << "Today's Events"
  events.each do |event|
    msg << "--------------------------"
    msg << event.to_s
  end
  msg << "--------------------------"
  post(msg.join("\n"))
end
