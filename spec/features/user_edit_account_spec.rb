require 'spec_helper'

feature "User edits account" do
  scenario "happy path" do
    User.create(email: "joe@example.com", password: "mypassword")
    visit '/'
    click_link "Sign in"
    fill_in "Email", with: "joe@example.com"
    fill_in "Password", with: "mypassword"
    click_button "Sign in"
    # save_and_open_page
    visit '/users/edit'
    fill_in "Email", with: "elvis@example.com"
    fill_in "Password", with: "newpassword"
    fill_in "Password confirmation", with: "newpassword"
    fill_in "Current password", with: "mypassword"
    click_button "Update"
    page.should have_content "You updated your account successfully."
    page.should_not have_link("Update")
  end

  scenario "failed account edit" do
    User.create(email: "joe@example.com", password: "mypassword")
    visit '/'
    click_link "Sign in"
    fill_in "Email", with: "joe@example.com"
    fill_in "Password", with: "mypassword"
    click_button "Sign in"
    # save_and_open_page
    visit '/users/edit'
    fill_in "Email", with: "elvis@example.com"
    fill_in "Password", with: "newpassword"
    fill_in "Password confirmation", with: "notnewpassword"
    fill_in "Current password", with: "mypassword"
    click_button "Update"
    page.should have_content "Password confirmationdoesn't match Password"
    # page.should_not have_link("Update")

    # page.should have_error("has already been taken", on: "Email")
    page.should have_error("doesn't match Password", on: "Password confirmation")
  end
end
