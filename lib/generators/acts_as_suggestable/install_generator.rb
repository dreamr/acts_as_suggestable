module ActsAsSuggestable
  module Generators
    class InstallGenerator < Rails::Generator::Base 
      def manifest 
        record do |m| 
          m.migration_template 'migration.rb', 'db/migrate', :migration_file_name => "create_suggestables"
        end
      end
    end
  end
end
