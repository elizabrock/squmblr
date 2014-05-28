require 'digest/md5'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  has_many :posts
  validates :username, uniqueness: true

  def gravatar_url
    md5 = Digest::MD5.new
    hash =  md5.hexdigest(email.strip.downcase)
    return 'http://www.gravatar.com/avatar/' + hash
  end

  after_create :send_welcome_email

  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end
end
