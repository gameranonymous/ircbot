require 'cinch'

class TwitchStreams

  include Cinch::Plugin
  require 'kappa'

  listen_to :channel
  match /twitch/

  def initalize(*args)

    super

    Twitch.configure do |config|
      config.client_id = 'gameranonymous-v1.0.0'
    end
  end

  def execute(m)

    users = ['didlix']
    Twitch.streams.find(:channel => users) do |stream|
      if stream.game_name.to_s.empty?
        m.reply "#{stream.channel.name} is streaming (#{stream.url})."
      else
        m.reply "#{stream.channel.name} is streaming (#{stream.url})."
      end
    end
  end
end
