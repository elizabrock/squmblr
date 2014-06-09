class Rating < ActiveRecord::Base
  scope :positive, ->{ where(opinion: 1) }
  scope :neutral, ->{ where(opinion: 0) }
  scope :negative, ->{ where(opinion: -1) }
  belongs_to :post
  belongs_to :user
  validates_presence_of :opinion
  validates_presence_of :post
  validates_presence_of :user
  validates :opinion, inclusion: { in: -1..1 }, allow_nil: false
end
