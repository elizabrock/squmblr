class Post < ActiveRecord::Base
  belongs_to :user
  has_many :ratings

  validates_presence_of :content
  validates_presence_of :user

  def rating_count(opinion)
    ratings.send(opinion).count
  end
end
