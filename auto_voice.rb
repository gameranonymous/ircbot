require_relative 'check_ignore'

module Cinch
  module Plugins
    class AutoVoice
      include Cinch::Plugin

      set plugin_name: "AutoVoice",
          help: "Automatically voices nicks",
          react_on: :channel#,
          #required_options: [:enabled_channels]


      def initialize(*args)
        super
        config[:enabled_channels] = {} if !config.has_key?(:enabled_channels) # Create hash for enabled_channels if key doesn't exist in config.

        if File.exist?('config/users.yml')
          @storage = YAML.load_file('config/users.yml')
        else
          @storage = {}
        end

      end

      listen_to :join, method: :on_join
      def on_join(m)
        return if check_ignore(m.user)
        m.channel.voice(m.user)
      end

    end
  end
end
