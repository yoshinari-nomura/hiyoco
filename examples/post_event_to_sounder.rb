#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.dirname(__FILE__))

require "grpc"
require "hiyoco/sounder/service_services_pb"
require_relative "event"

host = ARGV[0]
port = ARGV[1]

while json = STDIN.gets
  events = EventCollection.from_json(json.chomp)
  events.each do |ev|
    str = "#{ev.summary} is started after fifteen minutes"
    stub = Hiyoco::Sounder::Sounder::Stub.new("#{host}:#{port}", :this_channel_is_insecure)
    message = stub.say_event(Hiyoco::Calendar::Text.new(body: str )).result
  end
end
