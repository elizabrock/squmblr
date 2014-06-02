require 'spec_helper'

feature "User views posts" do

  scenario "views a index page of posts" do
    joe = Fabricate(:user, username: "joe")
    jill = Fabricate(:user, username: "jill")

    Fabricate(:published_post, content: "I'm a teapot", user: joe)
    Fabricate(:draft_post, content: "This is a draft", user: joe)
    Fabricate(:published_post, content: "Meme", user: jill)
    Fabricate(:published_post, content: "Gandalf", user: jill)

    visit root_path
    click_link "squmbls"
    page.should have_content "These are your squmbls:"
    page.should have_content("joe squmbd: I'm a teapot")
    page.should have_content("jill squmbd: Meme")
    page.should have_content("jill squmbd: Gandalf")
    page.should_not have_content("joe squmbd: This is a draft")
  end
end
