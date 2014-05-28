class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    @url = root_url
    mail(to:@user.email, subject:"Welcome to Squmblr")
  end
end
