require 'rubygems'
require 'rspec'
require 'rspec/mocks'
require 'shoulda'

require 'acts_as_suggestable'

root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "#{root}/db/aas.db"
)

Rspec.configure do |config|
  include RSpec::Mocks::Methods
  config.mock_with :rspec
  
end