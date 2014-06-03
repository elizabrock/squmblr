require 'spec_helper'

feature "New comments" do

  scenario "user creates a new comment" do
    login_as Fabricate(:user, email: "ruby@example.com", username: "ruby")
    click_link "write a squmbl"
    fill_in "Content", with: "Text input with body for test!"
    click_button "create squmbl"
    click_link "view"
    fill_in "Comment", with: "Text input comment body for test"
    current_path.should == post_path(Post.last)
    page.should have_content "Text input with body for test!"
    page.should have_content "Text input comment body for test"
  end

  scenario "user displays in comment" do
    login_as Fabricate(:user, email: "ruby@example.com", username: "ruby")
    click_link "write a squmbl"
    fill_in "Content", with: "Text input with body for test!"
    click_button "create squmbl"
    click_link "view"
    fill_in "Comment", with: "Text input comment body for test"
    current_path.should == post_path(Post.last)
    page.should have_content "Text input comment body for test"
    page.should have_content :user
  end

  scenario "user submites comment with no commnet" do
    login_as Fabricate(:user, email: "ruby@example.com", username: "ruby")
    click_link "write a squmbl"
    fill_in "Content", with: "Text input with body for test!"
    click_button "create squmbl"
    click_link "view"
    fill_in "Comment", with: ""
    current_path.should == post_path(Post.last)
    page.should have_content "Text input with body for test!"
  end
end