class UserMailer < ActionMailer::Base
  layout 'mail_layout'
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    @url = root_url
    mail(to:@user.email, subject:"Welcome to Squmblr")
  end

  def confirmation_email(user)
    @user = user
    @url = root_url
    mail(to:@user.email, subject:"Your password has been changed")
  end
end
