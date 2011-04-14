module ActsAsSuggestable
  extend ActiveSupport::Concern
  
  included do
    extend ClassMethods
  end
  
  module ClassMethods
    def is_suggestee
      send :include, SuggesteeMethods
    end
    
    def is_suggestor
      send :include, SuggestorMethods
    end
    
    def is_suggestable
      send :include, SuggestedMethods
    end
  end
  
  module SuggestorMethods
    def can_suggest?
      true
    end
    
    def suggest(suggestable, user)
      msg = <<-EOS
That model is not suggestable, please include ActsAsSuggestable and
call is_suggestable in the model
EOS
      raise Exception.new(msg) unless suggestable.is_suggestable?
      Suggestable.create(
        :suggested_by => self,
        :suggestion   => suggestable,
        :user         => user
      )
    end
  end
  
  module SuggesteeMethods
    def can_be_suggested_to?
      true
    end
    
    def has_suggestion?(model)
      Suggestable.by_user_id(self.id).by_type(model).any?
    end
  end
  
  module SuggestedMethods
    def is_suggestable?
      true
    end
  end
end

ActiveRecord::Base.send :include, ActsAsSuggestable
=======
require 'acts_as_suggestable/acts_as_suggestable'
require 'acts_as_suggestable/suggestable'
>>>>>>> b54178a5911ab7b485ea23a4374dc90b430b9643
