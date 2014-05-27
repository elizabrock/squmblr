require 'spec_helper'

feature "User signs up" do
  scenario "happy path" do
    visit '/'
    click_link "I'm Ready!"
    fill_in "Email", with: "joe@example.com"
    pending
    fill_in "Username", with: "joe"
    fill_in "Password", with: "mypassword"
    fill_in "Password confirmation", with: "mypassword"
    # PR 1: Captchas
    click_button "Sign up"
    page.should have_content "Welcome to Squmblr, joe!"
    current_path.should == dashboard_path
  end

  scenario "failed signup" do
    pending
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

    page.should have_error("already exists", on: "Email")
    page.should have_error("must match confirmation", on: "Password")
    page.should have_error("must be unique", on: "Username")
  end

  scenario "user fills in wrong captcha" do
    # PR 1: Captchas
  end

  scenario "user receives welcome email" do
    # PR 2: Welcome Emails
  end
end
