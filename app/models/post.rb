class Post < ApplicationResource
  self.site = 'http://localhost:3000'
  
  has_many :comments
  
  belongs_to :user
end
