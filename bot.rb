require 'cinch'
require './twitch.rb'

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "chat.freenode.org"
    c.channels = ["#gameranonymous"]
    c.nick = "ganonbot"
    c.plugins.plugins = [TwitchStreams]
  end

  on :message, "hello" do |m|
    m.reply "Hello, #{m.user.nick}"
  end
end

bot.start
