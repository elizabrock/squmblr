require 'spec_helper'

feature "New posts" do

  background do
    User.create(email: "ruby@example.com", username: "ruby", password: "password", password_confirmation: "password")
    visit new_user_session_path
    fill_in "Email", with: "ruby@example.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
  end

  scenario "user creates a new post" do
    click_link "write a squmbl"
    fill_in "Content", with: "Text input with body for test!"
    click_button "create squmbl"
    page.should have_content "Your squmbl has been created"
    current_path.should == posts_path
    page.should have_content "ruby squmbd: Text input with body for test!"
  end

  scenario "user fails to create a new post" do
    click_link "write a squmbl"
    fill_in "Content", with: ""
    click_button "create squmbl"
    page.should have_content "Your squmbl could not be created"
    page.should have_error("can't be blank", on: "Content")
  end
end
