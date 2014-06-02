module Features
  module SessionHelpers
    def login_as(user)

      user = Fabricate(user) if user == :admin_user

      if user.is_a? AdminUser
        visit 'admin/login'
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'Login'
      else
        visit new_user_session_path unless current_path == new_user_session_path
        fill_in 'Email', with: user.email
        fill_in 'Password', with: "password"
        click_button 'Sign in'
        page.should have_content("You have signed in successfully.")
      end
    end

    def sign_into_github_as(username, uid: nil, token: "d141ef15f79ca4c6f43a8c688e0434648f277f20")
      if uid.nil?
        user = User.find_by_username(username)
        uid = user.try(:github_uid) || '12345'
      end

      photo_url = "https://avatars.github.com/#{uid}?s=460"

      OmniAuth.config.add_mock(:github, {
        uid: uid,
        credentials: {
        token: token
      },
        info: {
        nickname: username,
        email: "#{username}smith@example.com",
        name: "#{username.capitalize} Smith",
        image: photo_url,
      },
      extra: {
        raw_info: {
        location: 'San Francisco',
        gravatar_id: '123456789'
      }
      }
      })
    end
  end
end

RSpec.configure do |config|
  config.include Features::SessionHelpers, type: :feature
end
