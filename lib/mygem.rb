require "mygem/version"

module Mygem
  class Rack
    def initialize(app, options = {:subscribe_me => {:options => [], :enabled_environments=> []}})
      puts "sadasdadasdasdsadasdasdsadoooooooooooo"
      @app = app
      puts "appp #{@app.inspect}..................."
      puts "testing #{options[:subscribe_me]}"
      puts "options  #{options.inspect}..............."
      @@subscribe_to ||= (options[:subscribe_me][:options] and options[:subscribe_me][:enabled_environments].include?(Rails.env)) ? options[:subscribe_me][:options] : nil
      @@subscribe_to.each do |opt|
        ActiveSupport::Notifications.subscribe /#{opt}/ do |*args|
          record_arguments(*args)
        end
      end
    end

    def record_arguments(*args)
      event = ActiveSupport::Notifications::Event.new(*args)
      #PageRequest.create! do |page_request|
        puts event.duration #query duration
        puts event.payload[:sql] # sql query
        puts event.payload[:binds] #bind variables
        puts event.payload[:name] # SQl: Insert/delte/update/begin/comit/load/model/exist
        puts event.payload[:connection_id]
        puts event.payload[:path]
      #end
    end

    def call(env)
     @app.call(env)
    end
  end

  #class Test < Rails::Railtie
  #
  #  def initialize(app = nil, options = {})
  #    puts "initizaerrrrrrrrrrrrrrrrrrrrrrrrrr"
  #
  #    puts "adadadjaksdjladhksajdhaksjd: #{app} ............"
  #    super()
  #    @name = options.fetch(:name, 'request.mygem')
  #  end
  #
  #  def call(env)
  #    puts "in call..................................."
  #    ActiveSupport::Notifications.instrument(@name, env) do
  #      @app.call(env)
  #    end
  #  end
  #
  #
  #end
  #
  #class Engine < ::Rails::Engine
  #  #config.exception_notification = ExceptionNotifier
  #  #config.exception_notification.logger = Rails.logger
  #
  #  puts "in engine"
  #  config.app_middleware.use Mygem::Rack
  #  puts "after engine"
  #end
end




