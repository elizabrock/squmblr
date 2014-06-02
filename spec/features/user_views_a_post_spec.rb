require 'spec_helper'

feature "User views a post" do

  scenario "as a public user" do
    joe = Fabricate(:user, username: "joe")
    test_post = Fabricate(:post, content: "I'm a teapot", user: joe)

    visit post_path(test_post)
    page.should have_content("I'm a teapot")
  end

end
