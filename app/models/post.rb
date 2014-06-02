class Post < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader

  validates_presence_of :content
  validates_presence_of :user

  scope :published, -> { where(published: true) }
  scope :drafts, -> { where(published: false) }
end
