$:.push(*Dir["vendor/rails/*/lib"])

require 'active_support'
require 'autotest'
require 'autotest/rspec'

Autotest.add_hook :initialize do |at|
  at.clear_mappings
  
  at.add_mapping(%r%^lib/acts_as_suggestable/(.*)\.rb$%) do |_, m|
    ["spec/#{m[1]}_spec.rb"]
  end
end

class Autotest::Rspec < Autotest
end