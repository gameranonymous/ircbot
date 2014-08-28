require 'cinch'
require "cinch/plugins/identify"
require './twitch.rb'
require './url_scraper.rb'
require './auto_voice.rb'

Config = OpenStruct.new

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "chat.freenode.org"
    c.channels = ["#gameranonymous"]
    c.nick = "ganonbot"
    c.plugins.plugins = [TwitchStreams, Cinch::Plugins::UrlScraper, Cinch::Plugins::Identify, Cinch::Plugins::AutoVoice]
    c.plugins.options[Cinch::Plugins::UrlScraper] = { enabled_channels: ["#gameranonymous"] }
    c.plugins.options[Cinch::Plugins::Identify] = {
      :username => ENV['NICKSERV_USERNAME'],
      :password => ENV['NICKSERV_PASSWORD'],
      :type     => :nickserv,
    }
  end

  on :message, "hello" do |m|
    m.reply "Hello, #{m.user.nick}"
  end
end

bot.start
