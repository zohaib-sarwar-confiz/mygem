require 'rails/generators/migration'
#require 'rails/generators/active_record'

module Mygem
  module Generators
    #class InstallGenerator < Rails::Generators::Base
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      # write public methods that should run in order
      desc "Installs Mygem and generates the necessary migrations"


      def self.source_root
        @_mygem_source_root ||= File.expand_path('../', __FILE__)
      end

      # add initializer
      def copy_initializer_file
        puts "***********************88888initlzer"
        #$:.unshift File.join(File.dirname(__FILE__),'../mygem/initializers/','templates')
        template "initializers/templates/mygem_initializer.rb", "config/initializers/mygem1.rb"
        #copy_file "mygem_initializer.rb", "config/initializers/mygem1.rb"
        #create_file "config/initializers/initializer.rb", "# Add initialization content here"
      end

      # create migration
      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end

      def create_migrations
        migration_template "active_record/templates/mygem_migrations.rb", "db/migrate/mygem_migration.rb"
      end

      # create route
      def setup_routes
        #inject_into_file "config/routes.rb", "\n  ActiveAdmin.routes(self)", after: /devise_for .*, ActiveAdmin::Devise\.config/
        append_to_file 'config/routes.rb', "\n bbbbbbbbb", :after => "The code goes below this line. Don't forget the Line break at the end\n"
      end

    end
  end
end
#module YourGemName
#  module Generators
#    class InstallGenerator < ::Rails::Generators::Base
#      include Rails::Generators::Migration
#      source_root File.expand_path('../templates', __FILE__)
#      desc "add the migrations"
#
#      def self.next_migration_number(path)
#        unless @prev_migration_nr
#          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
#        else
#          @prev_migration_nr += 1
#        end
#        @prev_migration_nr.to_s
#      end
#
#      def copy_migrations
#        migration_template "create_something.rb", "db/migrate/create_something.rb"
#        migration_template "create_something_else.rb", "db/migrate/create_something_else.rb"
#      end
#    end
#  end
#end
#
#class MygemMigrationGenerator < Rails::Generator::Base
#
#  def manifest
#    record do |m|
#      m.migration_template 'reviews_migration.rb',
#                           File.join('db', 'migrate'), :migration_file_name => 'is_reviewable_migration'
#    end
#  end
#
#end