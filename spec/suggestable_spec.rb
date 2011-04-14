require 'spec_helper'
require 'active_support/concern'

describe Suggestable do
  before(:each) do
    @suggestable = Suggestable.new
  end
  
  subject { @suggestable }
  
  it { should belong_to :user }
  it { should belong_to :suggested_by }
  it { should belong_to :suggestion }
end