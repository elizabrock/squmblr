require 'spec_helper'

feature "User authentication via Github" do
  scenario "User signs up via Github" do
    sign_into_github_as("joe")
    visit '/'
    click_link "I'm Ready!"
    click_link "Sign in with Github"
    page.should have_content "Successfully authenticated from github account."
    page.should have_content "Sign out"
    page.should_not have_content "Sign in"
    click_link "Sign out"
    page.should_not have_content "Sign out"
    page.should have_content "Sign in"

    user = User.last
    user.email.should == "joesmith@example.com"
    user.uid.should == "12345"
    user.username.should == "JoeSmith"
    user.token.should == "d141ef15f79ca4c6f43a8c688e0434648f277f20"
  end

  scenario "User can log in and log out with github" do
    Fabricate(:user, email: "joe@example.com", username: "joe", uid: "12345")
    sign_into_github_as("joe")
    visit '/'
    click_link "I'm Ready!"
    click_link "Sign in with Github"
    page.should have_content "Successfully authenticated from github account."
    page.should have_content "Sign out"
    page.should_not have_content "Sign in"
    click_link "Sign out"
    page.should_not have_content "Sign out"
    page.should have_content "Sign in"
  end

  scenario "Fix: revoked authorization breaks github auth" do
    sign_into_github_as("joe")
    visit '/'
    click_link "I'm Ready!"
    click_link "Sign in with Github"

    user = User.last
    user.email.should == "joesmith@example.com"
    user.uid.should == "12345"
    user.username.should == "JoeSmith"
    user.token.should == "d141ef15f79ca4c6f43a8c688e0434648f277f20"
    click_link "Sign out"
    sign_into_github_as("joe", token: "8675309")
    click_link "I'm Ready!"
    click_link "Sign in with Github"

    user = User.last
    user.email.should == "joesmith@example.com"
    user.uid.should == "12345"
    user.username.should == "JoeSmith"
    user.token.should == "8675309"
  end
end
