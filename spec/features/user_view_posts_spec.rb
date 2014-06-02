require 'spec_helper'

feature "User views posts" do

  scenario "views an index page of posts" do
    joe = Fabricate(:user, username: "joe")
    jill = Fabricate(:user, username: "jill")

    Fabricate(:post, content: "I'm a teapot", user: joe)
    Fabricate(:post, content: "Meme", user: jill)
    Fabricate(:post, content: "Gandalf", user: jill)

    visit root_path
    click_link "squmbls"
    page.should have_content "These are your squmbls:"
    page.should have_content("joe squmbd: I'm a teapot")
    page.should have_content("jill squmbd: Meme")
    page.should have_content("jill squmbd: Gandalf")
  end
end
