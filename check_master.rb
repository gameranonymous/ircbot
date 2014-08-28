require 'yaml'

module Cinch
  module Helpers

    def check_master(user)
      reload
      user.refresh

      return false unless !user.authname.nil?m

      if ((@storage.key?(user.nick)) && (@storage[user.nick].key? 'master') && (@storage[user.nick].key? 'auth'))
          mcheck = @storage[user.nick]['master']
          mauth = @storage[user.nick]['auth']
        return ((mauth == user.authname) && mcheck)
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
