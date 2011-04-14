$LOAD_PATH << "." unless $LOAD_PATH.include?(".")

begin
  require "rubygems"
  require "bundler"

  if Gem::Version.new(Bundler::VERSION) <= Gem::Version.new("0.9.5")
    raise RuntimeError, "Your bundler version is too old." +
     "Run `gem install bundler` to upgrade."
  end

  # Set up load paths for all bundled gems
  Bundler.setup
rescue Bundler::GemNotFound
  raise RuntimeError, "Bundler couldn't find some gems." +
    "Did you run \`bundle install\`?"
end

Bundler.require
require File.expand_path('../../lib/acts_as_suggestable', __FILE__)

require 'rubygems'
require 'rspec'
require 'rspec/mocks'
require 'shoulda'

root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "#{root}/db/aas.db"
)

Rspec.configure do |config|
  include RSpec::Mocks::Methods
  config.mock_with :rspec
  
end
