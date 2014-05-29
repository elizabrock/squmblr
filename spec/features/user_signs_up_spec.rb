require 'spec_helper'

feature "User signs up" do
  scenario "happy path" do
    visit '/'
    click_link "I'm Ready!"
    fill_in "Email", with: "joe@example.com"
    fill_in "Username", with: "joe"
    fill_in "Password", with: "mypassword"
    fill_in "Password confirmation", with: "mypassword"
    # PR 1: Captchas
    click_button "Sign up"
    page.should have_content "Welcome to Squmblr!"
    page.should_not have_link("I'm Ready!")

    click_link "Sign out"
    click_link "Sign in"
    fill_in "Email", with: "joe@example.com"
    fill_in "Password", with: "mypassword"
    click_button "Sign in"
    page.should have_content "You have signed in successfully"
  end

  scenario "signing in with username, rather than email" do
    # PR 5: username signin
    User.create(email: "joe@example.com", username: "joe", password: "password", password_confirmation: "password")
    visit '/'
    click_link 'Sign in'
    fill_in 'Email/Username', with: 'joe'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'
    page.should have_content('You have signed in successfully')
    page.should_not have_link("I'm Ready")
  end

  scenario "failed login" do
    # PR 5: username signin
    User.create(email: "joe@example.com", username: "joe", password: "password", password_confirmation: "password")
    visit '/'
    click_link 'Sign in'
    fill_in 'Email/Username', with: 'joeieieie'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'
    page.should have_content('Invalid login or password')
  end

  scenario "failed signup" do
    User.create(email: "joe@example.com", username: "joe", password: "password", password_confirmation: "password")
    visit '/'
    click_link "I'm Ready!"
    fill_in "Email", with: "joe@example.com"
    fill_in "Username", with: "joe"
    fill_in "Password", with: "mypassword"
    fill_in "Password confirmation", with: "notthesame"
    # PR 1: Captchas
    click_button "Sign up"
    page.should_not have_content "Welcome to Squmblr"
    page.should have_content "Your account could not be created."

    page.should have_error("has already been taken", on: "Email")
    page.should have_error("doesn't match Password", on: "Password confirmation")
    page.should have_error("has already been taken", on: "Username")
  end

  scenario "user fills in wrong captcha" do
    # PR 1: Captchas
  end

  scenario "user receives welcome email" do
    # PR 2: Welcome Emails
  end
end
