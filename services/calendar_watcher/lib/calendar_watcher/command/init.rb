require "goohub"
class CalendarWatcherCLI < Clian::Cli
    ################################################################
    # Command: init
    ################################################################
    desc "init", "Create new config file"

    expand_option :config

    def init
      config_file = options[:config] || DEFAULT_CONFIG_PATH
      Goohub::Command::Init.new(config_file)
    end
end # class CalendarWathcerCLI

