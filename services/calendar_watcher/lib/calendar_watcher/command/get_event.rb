class CalendarWatcherCLI < Clian::Cli 
  desc "get_event CALENDAR_ID EVENT_ID", "Show event by EVENT_ID"
  option :output, :default => "stdout", :desc => "specify output destination ( stdout or grpc:imformant or grpc:sounder ) host port"

  def get_event(calendar_id, event_id)
    output, dist, host, port = options[:output].split(":")
    event = client.get_event(calendar_id, event_id)

    if output == "stdout"
      puts "summary:    #{event.summary}\n"
      puts "id:         #{event.id}\n"
      puts "created:    #{event.created}\n"
      puts "kind:       #{event.kind}\n"
      puts "organized:  #{event.organizer.display_name}\n"
      puts "start_time: #{event.start.date_time}\n"
      puts "end_time:   #{event.end.date_time}\n"
    elsif output == "grpc"
      if !host
        host = "localhost"
      end

      if !port 
        port = "50051"
      end

      if dist == "sounder"
        stub = Hiyoco::CalendarWatcher::Sounder::Stub.new("#{host}:#{port}", :this_channel_is_insecure)
      elsif dist == "informant"
        stub = Hiyoco::CalendarWatcher::Informant::Stub.new("#{host}:#{port}", :this_channel_is_insecure)
      end

      s = create_date(event.start)
      e = create_date(event.end)

      desc = event.description || ""
      ev = Hiyoco::Calendar::Event.new(start: s, end: e, summary: event.summary, description: desc)
      message = stub.say_event(ev).result
      puts message

    end
  end 

  private

  def create_date(gdate)
    date = gdate.date || gdate.date_time
    time = Time.parse(date)
    gtime = Google::Protobuf::Timestamp.new
    gtime.from_time(time)

    d = Hiyoco::Calendar::Date.new(date: gtime)

    date_or_time = Hiyoco::Calendar::DateOrTime.new
    date_or_time.date = d

    return date_or_time
  end

end
