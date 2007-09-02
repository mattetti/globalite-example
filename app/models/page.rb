class Page < ActiveRecord::Base
  
  # Validation
  validates_presence_of :title, :body, :author
  
  
  # Simple example showing how to use localization in your model
  #   Do not try to do something like:
  #   **** app/models/user.rb :
  #   class User < ActiveRecord::Base
  #       GENDER_VALUES = [ [ :user_gender_man.l, "M" ], [ :user_gender_woman.l, "F" ] ]
  #       ....
  #   end
  #   
  #   instead try:
  #   **** app/models/user.rb :
  #   class User < ActiveRecord::Base
  #   def self.gender_values
  #     [ [ :user_gender_man.l, "M" ], [ :user_gender_woman.l, "F" ] ]
  #       ....
  #   end
  #   
  #   Otherwise your select options won't be reloaded. (and you should NOT change a constant during runtime anyway!)
  #   
  # in your view:
  # <%= select_tag 'test', options_for_select(User.gender_values) %>
  def self.test_array
    [[:title.l, 1], [:body.l, 2], [:author.l, 3] ]
  end
  
end
