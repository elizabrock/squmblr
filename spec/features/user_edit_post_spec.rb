require 'spec_helper'

feature "Edit posts" do
  before do
    current_user = Fabricate(:user, email: "ruby@example.com", username: "ruby")
    login_as current_user
    click_link "write a squmbl"
    fill_in "Content", with: "I'm going to save this as a draft!"
    click_button "save as draft"
    page.should have_content "Your squmbl has been saved as a draft"
    current_path.should == user_path(current_user)
    page.should have_content "Drafts"
    click_link "edit squmbl"
  end

  scenario "user successfully edits and publishes a post" do
    fill_in "Content", with: "This is no longer a draft"
    click_button "create squmbl"
    page.should have_content "This is no longer a draft"
  end

  scenario "user fails to edit and publish post" do
    fill_in "Content", with: ""
    click_button "create squmbl"
    page.should have_content "Your squmbl could not be created"
    page.should have_error("can't be blank", on: "Content")
  end

  scenario "user successfully edits a post and saves it as a draft again" do
    fill_in "Content", with: "This is a new version of the draft"
    click_button "save as draft"
    page.should have_content "This is a new version of the draft"
  end

  scenario "user fails to edit and save a post as a draft" do
    fill_in "Content", with: ""
    click_button "save as draft"
    page.should have_content "Your squmbl could not be saved"
    page.should have_error("can't be blank", on: "Content")
  end
end
