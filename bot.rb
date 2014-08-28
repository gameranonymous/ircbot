require 'cinch'
require './twitch.rb'
require './url_scraper.rb'

Config = OpenStruct.new

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "chat.freenode.org"
    c.channels = ["#gameranonymous"]
    c.nick = "ganonbot"
    c.plugins.plugins = [TwitchStreams, Cinch::Plugins::UrlScraper]
    c.plugins.options[Cinch::Plugins::UrlScraper] = { enabled_channels: ["#gameranonymous"] }
  end

  on :message, "hello" do |m|
    m.reply "Hello, #{m.user.nick}"
  end
end

bot.start
