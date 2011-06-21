module Tane
  class << self
    @@env_vars
    
    def load_env
      pairs = File.read("./env").split(" ")

      @@env_vars = {}

      pairs.each do |pair|
        key = pair.split("=").first
        value = pair.split("=")[1..-1].join('=')
        @@env_vars[key] = value
      end
    end


    def set_env!
      @@env_vars.each_pair do |key, value|
        ENV[key] = value
      end
    end


    def restart_nginx
      `sudo nginx -s reload`
    end


    def start_rails(command)
      if command.strip == "c"
        puts "bundle exec rails c"
        Kernel.exec("bundle exec rails c")
      elsif command.strip == "s"
        if @@env_vars["RAILS_PORT"].nil?
          warn "RAILS_PORT not found in ENV, not linking. Could cause problems."
        end

        puts "bundle exec rails s -p #{@@env_vars['RAILS_PORT']}"
        puts "You can reach this app at: #{@@env_vars['ACCESS_URL']}"

        Kernel.exec("bundle exec rails s -p #{@@env_vars['RAILS_PORT']}")
      else
        puts "unknown command: use 'c' or 's'"
      end
    end


    def exec(command)
      load_env
      set_env!
      
      restart_nginx

      start_rails(command)
    end
  end
end
