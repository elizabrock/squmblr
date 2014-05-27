require 'spec_helper'

feature "User views posts" do
  scenario "views a index page of posts" do
    User.create(email: "ruby@example.com", username: "ruby", password: "password", password_confirmation: "password")
    visit "/posts"
    page.should have_content "These are your squmbles:"
    page.should have_content "New Squmble"
    page.should have_css("h1")
    click_link "New Squmble"
  end

end
