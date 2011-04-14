require 'active_record'

class Suggestable < ActiveRecord::Base
  belongs_to :user
  belongs_to :suggested_by, :polymorphic => true
  belongs_to :suggestion,   :polymorphic => true
  
  scope :by_user_id,  lambda {|user_id| 
                        where('suggestables.user_id = ?', user_id)}
        
  scope :by_type,     lambda {|type| 
                        where('suggestables.suggestion_type = ?', type.to_s)}
end