class Comment < ActiveRecord::Base

  belongs_to :post
  belongs_to :user

  validates_presence_of :comment
  validates_presence_of :post
  validates_presence_of :user

  default_scope -> { order('created_at ASC') }
end
