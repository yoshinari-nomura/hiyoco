module CalendarWatcher
  dir = File.dirname(__FILE__) + "/calendar_watcher"

  autoload :Command, "#{dir}/command.rb"
  autoload :VERSION, "#{dir}/version.rb"
end
