class Follow < ActiveRecord::Base
  belongs_to :user
  belongs_to :followee, class_name: "User"
  has_many :posts, through: :followee, source: :posts
end
