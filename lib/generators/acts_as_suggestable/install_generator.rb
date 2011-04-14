require 'rails/generators/migration'

module ActsAsSuggestable
  module Generators
    class InstallGenerator < Rails::Generators::Base 
      include Rails::Generators::Migration
      source_root File.expand_path("../templates", __FILE__)
      
      def self.next_migration_number(path)
        Time.now.utc.strftime("%Y%m%d%H%M%S")
      end
      
      def manifest 
        migration_template 'migration.rb', 'db/migrate/create_suggestables'
      end
    end
  end
end
