require 'spec_helper'

feature "User rates a post" do
  scenario "happy path" do
    jill = Fabricate(:user, username: "jill")
    post = Fabricate(:post, content: "Gandalf", user: jill)
    Rating.create(user:jill, post: post, opinion: 1)

    login_as Fabricate(:user, username: "joe")
    click_link "squmbls"
    page.should have_selector("input[type=submit][value='Positive']")
    page.find('.positive').should have_content "1"
    page.should have_selector("input[type=submit][value='Neutral']")
    page.find('.neutral').should have_content "0"
    page.should have_selector("input[type=submit][value='Negative']")
    page.find('.negative').should have_content "0"
    click_button "Positive"
    page.find('.positive').should have_content "2"
    click_button "Neutral"
    page.find('.positive').should have_content "1"
    page.find('.neutral').should have_content "1"
  end
end
