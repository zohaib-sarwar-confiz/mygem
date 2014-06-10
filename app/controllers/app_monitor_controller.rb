#module Mygem
#  module Controllers
#    # Provide sign in and sign out functionality.
#    # Included by default in all controllers.
#    module AppMonitor
#      def index
#        puts "in app mointor"
#      end
#    end
#
#  end
#end

module Mygem
  class AppMonitorController < Mygem::ApplicationController
    def index
      puts "lllllllllllllllllllllllllllllllllllllllllllherolliiiii"
    end
  end
end