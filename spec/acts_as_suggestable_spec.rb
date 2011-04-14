require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + '/../lib/acts_as_suggestable/acts_as_suggestable'
require File.dirname(__FILE__) + '/../lib/acts_as_suggestable/suggestable'

class SuggestableThing
  include ActsAsSuggestable
  
  is_suggestable
  
  def self.base_class
    self
  end
end

class SuggestorThing
  include ActsAsSuggestable
  
  is_suggestor
  
  def self.base_class
    self
  end
  
  def destroyed?
    false
  end
  
  def persisted?
    false
  end
  
  def save
    true
  end
end

class SuggesteeThing
  include ActsAsSuggestable
  
  is_suggestee
end

describe ActsAsSuggestable do
  describe "SuggestorMethods" do
    describe "can_suggest?" do
      it "should be true" do
        SuggestorThing.new.can_suggest?.should == true
      end
    end
    
    describe "suggest(suggestable, user)" do
      it "should receive create" do
        Suggestable.should_receive(:create).once
        SuggestorThing.new.suggest(SuggestableThing.new, SuggesteeThing.new)
      end
    end
  end
  
  describe "SuggestedMethods" do
    describe "is_suggestable?" do
      it "should be true" do
        SuggestableThing.new.is_suggestable?.should == true
      end
    end
  end
  
  describe "SuggesteeMethods" do
    describe "can_be_suggested_to?" do
      it "should be true" do
        SuggesteeThing.new.can_be_suggested_to?.should == true
      end
    end
    
    describe "has_suggestion?(model)" do
      it "does should receive by_user_id and by_type" do
        
      end
    end
  end
end