class Comment < ApplicationResource
  self.site = 'http://localhost:3000/api/post/:post_id'
  belongs_to :user
end
