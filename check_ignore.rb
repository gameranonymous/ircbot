require 'cinch'
require 'yaml'

module Cinch
  module Helpers

    def check_ignore(user)
      reload
      if ((@storage.key?(user.nick)) && (@storage[user.nick].key? 'ignore'))
        ignore = @storage[user.nick]['ignore']
        return ignore
      end
    end

    def reload
      if File.exist?('config/users.yml')
       @storage = YAML.load_file('config/users.yml')
      else
        @storage = {}
      end
    end
  end
end
