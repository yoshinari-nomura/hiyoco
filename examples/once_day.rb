#!/usr/bin/env ruby

require "./event.rb"
require "date"
require "json"

class Queue
  def initialize
    @queue = []
    @mutex = Mutex.new
  end

  def enqueue(item)
    with_mutex do
      @queue << item
    end
    return self
  end

  def dequeue
    with_mutex do
      return @queue.shift
    end
  end

  private

  def with_mutex(&block)
    begin
      @mutex.lock
      yield
    ensure
      @mutex.unlock
    end
  end
end

q = Queue.new

Thread.new do
  loop do
    dt = DateTime.now
    if dt.hour == 10 && dt.min == 0 then
      events = EventCollection.new
      while ev = q.dequeue
        events << ev 
      end
      puts events.to_json unless events.empty?
      STDOUT.flush
    end
    sleep 60
  end
end

while json = gets.chomp
  events = EventCollection.from_json(json)
  JSON.parse(events.to_json).each do |ev|
    q.enqueue(ev)
  end
end



