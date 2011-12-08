class Comment < ActiveRecord::Base
  
  validates_presence_of :username, :content
  
end
