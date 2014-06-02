class Post < ActiveRecord::Base
  acts_as_commentable # :create, :destroy
  belongs_to :user

  validates_presence_of :content
  validates_presence_of :user
<<<<<<< HEAD

  has_many :comments
  accepts_nested_attributes_for :comments, :reject_if => :all_blank, :allow_destroy => true
=======
  mount_uploader :image, ImageUploader
>>>>>>> e5afeef916031b96c7a72d6632f3bcd73984ef95
end
