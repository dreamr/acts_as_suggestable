require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + '/../lib/acts_as_suggestable/suggestable'

ActiveRecord::Base.connection.execute("DROP TABLE IF EXISTS 'suggestables'")
ActiveRecord::Base.connection.create_table(:suggestables) do |t|
  t.integer :suggested_by_id
  t.string :suggested_by_type
  t.integer :suggestion_id
  t.string :suggestion_type
  t.integer :user_id
end

describe Suggestable do
  before(:each) do
    ActiveRecord::Base.connection.increment_open_transactions
    ActiveRecord::Base.connection.begin_db_transaction
    @suggestable = Suggestable.new
  end

  after(:each) do
      ActiveRecord::Base.connection.rollback_db_transaction
      ActiveRecord::Base.connection.decrement_open_transactions
  end
  
  subject { @suggestable }
  
  it { should belong_to :user }
  it { should belong_to :suggested_by }
  it { should belong_to :suggestion }
end