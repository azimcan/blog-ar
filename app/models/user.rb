class User < ApplicationResource
  self.site = 'http://localhost:3000'
  has_many :posts
	has_many :comments
end
