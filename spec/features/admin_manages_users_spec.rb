require 'spec_helper'

feature "Admin manages posts" do

  scenario "deleting a post" do

    bob = User.new(email: "bob@example.com", username: "bob", password: "bob", password_confirmation:"bob")
    login_as(:admin_user)
    Fabricate(:post, user: bob, content: "I'm Bob")
    click_link 'Posts'
    link = page.find('tr', text: "I'm Bob").find("a", text: "Delete")
    link.click
    page.should have_content("Post was successfully destroyed.")
    visit '/posts'
    page.should_not have_content("I'm Bob")

  end

end
