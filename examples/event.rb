require "json"
require "date"

class Event
  attr_reader :start_time, :end_time, :summary, :description

  def initialize(start_time, end_time, summary, description)
    @start_time, @end_time, @summary, @description =
     start_time, end_time, summary, description
  end

  def to_s
    "Summary:#{summary}\nDescription:#{description}\nStart at #{start_time.strftime("%Y-%m-%d %H:%M")}\nEnd at #{end_time.strftime("%Y-%m-%d %H:%M")}\n"
  end

  def to_json(*arg)
    to_hash.to_json
  end

  def to_hash
    {
      :start       => start_time,
      :end         => end_time,
      :summary     => summary,
      :description => description
    }
  end

  def self.from_hash(hash)
    Event.new(DateTime.parse(hash["start"]),
              DateTime.parse(hash["end"]),
              hash["summary"],
              hash["description"])
  end

  def self.from_json(json)
    Event.from_hash(JSON.parse(json))
  end
end

class EventCollection
  include Enumerable

  def initialize
    @events = []
  end

  def <<(event)
    @events << event
  end

  def each(&block)
    @events.each do |ev|
      yield ev
    end
  end

  def to_json
    @events.to_json
  end

  def self.from_json(json)
    events = EventCollection.new
    JSON.parse(json).each do |h|
      events << Event.from_hash(h)
    end
    return events
  end

  def empty?
    @events.empty?
  end
end


