require 'spec_helper'

feature "Edit posts" do

  scenario "user successfully edits a post" do
    current_user = Fabricate(:user, email: "ruby@example.com", username: "ruby")
    login_as current_user
    click_link "write a squmbl"
    fill_in "Content", with: "I'm going to save this as a draft!"
    click_button "save as draft"
    page.should have_content "Your squmbl has been saved as a draft"
    current_path.should == user_path(current_user)
    page.should have_content "Drafts"
    click_link "edit squmbl"
    fill_in "Content", with: "This is no longer a draft"
    click_button "create squmbl"
    page.should have_content "This is no longer a draft"
  end
end
