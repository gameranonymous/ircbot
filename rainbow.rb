require 'cinch'

# -*- coding: utf-8 -*-

class String # moved from lib\obj_ext\string.rb
  def irc_colorize
    self.gsub(/!\[(.*?)\]/) { $1.tr('boruic', 2.chr + 15.chr + 18.chr + 31.chr + 29.chr + 3.chr) }
    #Note to self, tr and gsub is your friend!
    #Thanks to j416 on #ruby@freenode!
  end
end

module Cinch
  module Plugins
    class Rainbow
      include Cinch::Plugin

      set plugin_name: "Rainbow", help: "Rainbowificates your text.\nUsage: `!rainbow [text]`.", suffix: /$/

      def rainbowification(s)
        s.gsub(/\x03([0-9]{2}(,[0-9]{2})?)?/,"") # Because total function abuse.
        colour = %w{04 07 08 09 10 06 13}
        i = Random.new.rand(0..colour.size-1);
        new_string = ""
        s.each_char {|c|
          new_string << "\x03#{colour[i]}#{c}";
          i = i < colour.size-1 ? i.next : 0;
        }
        new_string
      end

      match /rainbow (.+)/, method: :execute_rainbow
      def execute_rainbow(m, string)
        m.reply(rainbowification(string),false);
      end
    end
  end
end
