module Features
  module SessionHelpers
    def login_as(user)
      visit new_user_session_path unless current_path == new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: "password"
      click_button 'Sign in'
      page.should have_content("You have signed in successfully.")
    end
  end
end

RSpec.configure do |config|
  config.include Features::SessionHelpers, type: :feature
end
