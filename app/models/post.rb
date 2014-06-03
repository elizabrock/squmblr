class Post < ActiveRecord::Base
  belongs_to :user
  has_many :ratings

  validates_presence_of :content
  validates_presence_of :user

  def rating_count(opinion)
    if opinion == 'negative'
      ratings.where(opinion: -1).count
    elsif opinion == 'neutral'
      ratings.where(opinion: 0).count
    elsif opinion == 'positive'
      ratings.where(opinion: 1).count
    elsif opinion == 'all'
      ratings.count(:opinion)
    end
  end
end
