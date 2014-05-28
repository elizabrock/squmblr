require 'spec_helper'

feature "User visits profile page" do
  scenario "happy path" do
    login_as :user, email: "mknicos@gmail.com", user_name: "bob"
    save_and_open
  end


  scenario "user not logged in" do
  end
end
