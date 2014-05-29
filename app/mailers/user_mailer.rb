class UserMailer < ActionMailer::Base
  # layout 'mail_layout'
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    @url = root_url
    mail(to:@user.email, subject:"Welcome to Squmblr") do |format|
      format.html { render layout: 'user_mailer' }
      # format.text
    end
  end
end
