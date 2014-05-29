squmblr
-------

Meme Blogging / Nerd Tumblr


First PR Features:
=========
 1. Captcha [Steven + Sam]
 2. Welcome emails [Jeremy + Max + Mitch]
 3. Oauth w/ Github [Nat + Adam]
 4. Password Reset (incl. emails) [Robert + Peder]
 5. Username signin [Drew + Randy]
 6. Account edit [Giovanni + James]
 7. Gravatar / User profile page [Matt + Matt]
 8. Start stylin' [Sam W. + Spencer]
 9. Post index page [Aimee + Tyler]


Second PR Features:
==========
 1. Image uploads with carrierwave [Tyler + Aimee]



-- Webmock

Features:
=========

Sign Up Process:

  * OAuth w/ Github
  * Captcha
  * Theme

Blog Posts:

  * Funny Image
  * Meme Image (w/API!!)
    * http://s567.photobucket.com/user/chercabula/media/Pics%20for%20Blogposts/January%202012/tumblr-dashboard.png.html
    * https://www.google.com/search?q=meme+api&oq=meme+api&aqs=chrome..69i57j0l5.1751j0j7&sourceid=chrome&es_sm=91&ie=UTF-8
    * https://api.imgflip.com/
  * Animated Gifs
  * Tweet mocking
  * YouTube links

Comments

Draft posts!

Blogs:

  * Follow
  * Recommended blogs?

Dashboard:

  * Post blogs
  * View stream

Admin:

  * Blacklisting
  * Censoring
  * Etc.

Add-ons:

  * Infinite scroll
  * Ecommerce integration (gilding posts)
  * SSL!
  * Notifications
  * Voting
  * Social Sharing!
  * Spamming / Invitations


## Project Documentation

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Setup Instructions

In order to utilize functionality of Figaro (which allows you to hide secrets and keys),
follow the below instructions:

1. Copy `config/application.yml.example` to `config/application.yml`
2. Fill in the correct Github API key (either get them from Eliza or set one up under developer applications, here: https://github.com/settings/applications)
3. `rake db:create:all`
4. `rake db:migrate`
5. `rake`
6. Confirm that rake passed.  If it didn't, that means your setup is missing something.
7. Make sure `config/application.yml` is in your .gitignore file
