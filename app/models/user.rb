require 'digest/md5'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :login
  devise :database_authenticatable, :registerable,
         :rememberable, :recoverable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:github]

  has_many :posts
  validates :username, uniqueness: true

  def self.find_for_database_authentication(conditions={})
    self.where("username = ?", conditions[:email]).limit(1).first ||
    self.where("email = ?", conditions[:email]).limit(1).first
  end

  def gravatar_url
    md5 = Digest::MD5.new
    hash =  md5.hexdigest(email.strip.downcase)
    return 'http://www.gravatar.com/avatar/' + hash
  end

  def self.find_or_create_for_github_oauth(auth)
    auth_token = auth.credentials.token
    user = User.where(uid: auth.uid).first_or_create do |user|
      user.uid = auth.uid
      user.token = auth.credentials.token
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name
      user.github_avatar = auth.extra.raw_info.gravatar_id
    end
    unless user.token == auth_token
      user.update_attribute(:token, auth_token)
    end
    user
  end

  after_create :send_welcome_email

  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      where(conditions).first
    end
  end
end
