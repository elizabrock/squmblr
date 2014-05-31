require 'spec_helper'

feature "User edits account" do
  background do
    user = Fabricate(:user, email: "joe@example.com")
    login_as user
  end

  scenario "happy path" do
    visit edit_user_registration_path
    fill_in "Email", with: "elvis@example.com"
    fill_in "Password", with: "newpassword"
    fill_in "Password confirmation", with: "newpassword"
    fill_in "Current password", with: "password"
    click_button "Update"
    page.should have_content "You updated your account successfully."
    page.should_not have_link("Update")
  end

  scenario "user enters wrong password confirmation" do
    visit edit_user_registration_path
    fill_in "Email", with: "elvis@example.com"
    fill_in "Password", with: "newpassword"
    fill_in "Password confirmation", with: "notnewpassword"
    fill_in "Current password", with: "password"
    click_button "Update"
    page.should have_content "Please review the problems below:"
    page.should have_error("doesn't match Password", on: "Password confirmation")
  end

  scenario "user enters wrong current password" do
    visit edit_user_registration_path
    fill_in "Email", with: "elvis@example.com"
    fill_in "Password", with: "newpassword"
    fill_in "Password confirmation", with: "newpassword"
    fill_in "Current password", with: "notpassword"
    click_button "Update"
    page.should have_content "Please review the problems below:"
    page.should have_error("is invalid", on: "Current password")
  end

  scenario "user leaves email blank" do
    visit edit_user_registration_path
    fill_in "Email", with: ""
    fill_in "Password", with: "newpassword"
    fill_in "Password confirmation", with: "newpassword"
    fill_in "Current password", with: "password"
    click_button "Update"
    page.should have_content "Please review the problems below:"
    page.should have_error("can't be blank", on: "Email")
  end
end
