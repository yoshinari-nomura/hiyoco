require "date"
require "pp"

class CalendarWatcherCLI < Clian::Cli
  desc "today_events", "Show today's events."
  option :output, :default => "grpc:localhost:50051", :desc => "specify output format (grpc:host:port or json or prety)"

  def today_events()
    format, host, port = options[:output].split(":")
    min = Date.today.strftime("%Y-%m-%dT00:00:00+09:00")
    max = Date.today.strftime("%Y-%m-%dT23:59:59+09:00")

    today_events = EventCollection.new

    raw_calendars = client.list_calendar_lists()
    calendars = Goohub::Resource::CalendarCollection.new(raw_calendars)

    calendars.each do |c|
      raw_events = client.list_events(c.id, time_max: max, time_min: min)

      raw_events.items.each do |ev|
        start_time = date_or_datetime(ev.start)
        end_time = date_or_datetime(ev.end)

        today_events << Event.new(start_time, end_time, ev.summary, ev.description)
      end
    end

    if format == "grpc"
      stub = Hiyoco::CalendarWatcher::Filter::Stub.new("#{host}:#{port}", :this_channel_is_insecure)
      today_events.each do |ev|
        s = create_gprc_date(ev.start_time)
        e = create_gprc_date(ev.end_time)
        desc = ev.description || ""

        grpc_ev = Hiyoco::Calendar::Event.new(start: s, end: e, summary: ev.summary, description: desc)
        puts stub.say_event(grpc_ev).result
      end

    elsif format == "json"
      puts today_events.to_json

    elsif format == "prety"
      today_events.each do |ev|
        puts ev.to_s
        # TODO: Fix format
        # ex)
        #  10:00-12:00 meeting
        #       allday someone's birthday
      end
    end
  end

  private

  def date_or_datetime(date)
    date.date_time || date.date
  end

  def create_gprc_date(date)
    time = date.to_time

    gtime = Google::Protobuf::Timestamp.new
    gtime.from_time(time)
    date_or_time = Hiyoco::Calendar::DateOrTime.new

    if date.class == DateTime
      d = Hiyoco::Calendar::DateTime.new(dateTime: gtime, timeZone: date.zone)
      date_or_time.dateTime = d
    else
      d = Hiyoco::Calendar::Date.new(date: gtime)
      date_or_time.date = d
    end

    return date_or_time
  end

end

class Event
  attr_reader :start_time, :end_time, :summary, :description

  def initialize(start_time, end_time, summary, description)
    @start_time, @end_time, @summary, @description =
      start_time, end_time, summary, description
  end

  def to_s
    "start:#{start_time}\nend:#{end_time}\nsummary:#{summary}\ndescription:#{description}\n"
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
end
