require 'spec_helper'

feature "New posts" do
  scenario "user creates a new post" do
    User.create(email: "ruby@example.com", username: "ruby", password: "password", password_confirmation: "password")
    click_link "New Squmble"
    fill_in "Title" with "New Test Post"
    fill_in "Body" with "Text input with body for test!"
    click_lick "Create Post"
  end
end
