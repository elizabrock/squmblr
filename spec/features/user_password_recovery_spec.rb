require 'spec_helper'

feature "User recovers password" do
  scenario "happy path email" do
    Fabricate(:user, email: "joe@example.com")
    visit '/'
    click_link "Sign in"
    click_link "Forgot your password?"
    fill_in "Email or Username", with: "joe@example.com"
    click_button "Send me reset password instructions"
    page.should have_content "You will receive an email with instructions on how to reset your password in a few minutes."
  end
  scenario "happy path username" do
    Fabricate(:user, username: "joe")
    visit '/'
    click_link "Sign in"
    click_link "Forgot your password?"
    fill_in "Email or Username", with: "joe"
    click_button "Send me reset password instructions"
    page.should have_content "You will receive an email with instructions on how to reset your password in a few minutes."
  end
  scenario "wrong" do
    visit '/'
    click_link "Sign in"
    click_link "Forgot your password?"
    fill_in "Email or Username", with: "not_real@example.com"
    click_button "Send me reset password instructions"
    page.should have_content "not found"
  end
end
