require 'spec_helper'

feature "User views posts" do

  scenario "views a index page of posts" do
    joe = User.create!(email: "joe@example.com", username: "joe", password: "password", password_confirmation: "password")
    jill = User.create!(email: "jill@example.com", username: "jill", password: "password", password_confirmation: "password")

    Post.create!(content: "I'm a teapot", user: joe)
    Post.create!(content: "Meme", user: jill)
    Post.create!(content: "Gandalf", user: jill)

    visit root_path
    click_link "squmbls"
    page.should have_content "These are your squmbls:"
    page.should have_content "new squmbl"
    page.should have_content("joe squmbd: I'm a teapot")
    page.should have_content("jill squmbd: Meme")
    page.should have_content("jill squmbd: Gandalf")
  end
end
