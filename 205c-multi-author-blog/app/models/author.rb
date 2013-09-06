class Author < ActiveRecord::Base
  has_many :blog_posts
  has_secure_password
  validates :full_name, presence: true, uniqueness: true
end
