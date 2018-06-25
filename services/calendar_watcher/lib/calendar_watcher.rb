module CalendarWatcher
  dir = File.dirname(__FILE__) + "/calendar_watcher"

  autoload :Client,               "#{dir}/client.rb"
  autoload :Command,              "#{dir}/command.rb"
  autoload :Config,               "#{dir}/config.rb"
  autoload :VERSION,              "#{dir}/version.rb"
end
