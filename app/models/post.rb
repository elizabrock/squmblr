class Post < ActiveRecord::Base
  acts_as_commentable # :create, :destroy
  belongs_to :user

  validates_presence_of :content
  validates_presence_of :user

  has_many :comments
  accepts_nested_attributes_for :comments, :reject_if => :all_blank, :allow_destroy => true
end
