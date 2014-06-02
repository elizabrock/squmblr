require 'spec_helper'

feature "User follows other user" do
  scenario "working follow" do
    Fabricate(:user, email: "joe@example.com", username: "joe")
    login_as Fabricate(:user, email: "ruby@example.com", username: "ruby")
    visit '/users/joe'
    click_link "Follow this user"
    current_path.should == root_path
    page.should have_content "You have followed joe."
    click_link "squmbls"
    page.should have_content "You are following these people:"
    page.should have_content "joe"
  end

  scenario "can't follow yourself" do
    login_as Fabricate(:user, email: "ruby@example.com", username: "ruby")
    visit '/users/ruby'
    page.should_not have_content "Follow this user"
    page.should have_content "You are the current user"
  end
end

