require 'spec_helper'

feature "User visits profile page" do
  let!(:bob) {Fabricate(:user, email: "bob@example.com", username: "bob", password: "password")}
  let!(:matt) {Fabricate(:user, email: "mknicos@gmail.com", username: "matt", password: "password")}

  scenario "User visits own profile page" do
    login_as matt
    visit user_path('matt')
    page.should have_content "mknicos@gmail.com"
  end

  scenario "User visits someone elses profile page" do
    login_as matt
    visit user_path('bob')
    page.should have_content "bob@example.com"
    page.should_not have_content "mknicos@gmail.com"
  end

  scenario "user not logged in" do
    visit user_path('bob')
    page.should have_content "bob@example.com"
    page.should_not have_content "mknicos@gmail.com"
  end
end
