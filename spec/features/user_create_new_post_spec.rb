require 'spec_helper'

feature "New posts" do

  scenario "user creates a new post" do
    login_as Fabricate(:user, email: "ruby@example.com", username: "ruby")
    click_link "write a squmbl"
    fill_in "Content", with: "Text input with body for test!"
    attach_file "Image", 'spec/data/Capybara.jpg'
    click_button "create squmbl"
    page.should have_content "Your squmbl has been created"
    current_path.should == posts_path
    page.should have_content "ruby squmbd: Text input with body for test!"
    page.find('img')['src'].should have_content '/thumb_Capybara.jpg'
  end

  scenario "user fails to create a new post" do
    login_as Fabricate(:user, email: "ruby@example.com", username: "ruby")
    click_link "write a squmbl"
    fill_in "Content", with: ""
    click_button "create squmbl"
    page.should have_content "Your squmbl could not be created"
    page.should have_error("can't be blank", on: "Content")
  end

  scenario "if I'm not logged in" do
    visit root_path
    page.should_not have_content("write a squmbl")

    visit posts_path
    page.should_not have_content("new squmbl")

    visit new_post_path
    current_path.should == new_user_session_path
    page.should have_content("You need to sign in or sign up before continuing.")
  end
end
