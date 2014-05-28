require 'spec_helper'

feature "New posts" do
  scenario "user creates a new post" do
    User.create(email: "ruby@example.com", username: "ruby", password: "password", password_confirmation: "password")
    visit "users/sign_in"
    fill_in "user[email]", with: "ruby@example.com"
    fill_in "user[password]", with: "password"
    click_button "Sign in"

    visit "/posts/new"
    fill_in "Content", with: "Text input with body for test!"
    click_button "Create Squmble"
    page.should have_content "Text input with body for test!"
  end
end
