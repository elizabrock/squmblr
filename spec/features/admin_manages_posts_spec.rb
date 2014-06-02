require 'spec_helper'

feature "Admin manages posts" do

  scenario "deleting a post" do

    bob = User.new(email: "bob@example.com", username: "bob", password: "bob", password_confirmation:"bob")
    login_as(:admin_user)
    Fabricate(:user, username: 'Bob', email: 'bob@aol.com', encrypted_password: 'bob')
    click_link 'Users'
    link = page.find('tr', text: "bob@aol.com").find("a", text: "Delete")
    link.click
    page.should have_content("User was successfully destroyed.")
    visit '/admin/users'
    page.should_not have_content("bob@aol.com")

  end

end
