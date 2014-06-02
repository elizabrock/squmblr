squmblr
-------

Meme Blogging / Nerd Tumblr


First PR Features:
=========
 1. Captcha [Steven + Sam]
 2. ✓ Welcome emails [Jeremy + Max + Mitch]
 3. ✓ Oauth w/ Github [Nat + Adam]
 4. ✓ Password Reset (incl. emails) [Robert + Peder]
 5. ✓ Username signin [Drew + Randy]
 6. ✓ Account edit [Giovanni + James]
 7. ✓ Gravatar / User profile page [Matt + Matt]
 8. Start stylin' [Sam W. + Spencer]
 9. ✓ Post index page [Aimee + Tyler]

✓

Second PR Features:
==========
 1. ✓ Image uploads with carrierwave [Tyler + Aimee]
 2. Individual squmblogs (w/ following) [Max + Mitch + Jeremy]
 3. x Up/Down/Meh voting!! (w/ rjs and poltergeist) [Peder + Robert]
 4. ✓ Social Sharing + pretty urls on user pages [Matt + Matt]
 5. Mailer Layouts / Pretty Emails (take a look at mailview gem) [James + Giovanni]
 6. x Meme APIs!! [Randy + Drew]
 7. Comments [Spencer + Sam W.]
 8. Draft Posts (w/ ability to edit before publishing) [Nat + Adam]
 9. Admin Panel (active\_admin, selectively enable features) [Sam T. + Steven]

Matt
Matt
Tyler
Aimee

Third PR Features:
==================

 1. Resque / Queued Emails [Aimee]

Comment Notifications

Future Class Features:
======================

 1. Infinite Scroll
 2. SSL
 3. Postmark


Features:
=========

Sign Up Process:

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

Blogs:

  * Recommended blogs?

Admin:

  * Blacklisting
  * Censoring
  * Etc.

Maybe?
======

  * Ecommerce integration (gilding posts)
  * Spamming / Invitations


## Project Setup

* Ruby Version: 2.1.1
* System Dependencies: phantomjs, imagemagick
* Configuration
    1. *Copy* config/database.yml.example to config/database.yml
    2. Change any database settings in config/database.yml (*NOT* the example file) that are necessary for your machine.

* Database creation
    1. `rake db:create:all`
    2. `rake db:migrate`
* Database initialization
    1. `rake db:seed`
* How to run the test suite
    1. `rake`
* Services (job queues, cache servers, search engines, etc.)
    * N/A
* Deployment instructions
    * `heroku create <application_name>`
    * `git push heroku master`
    * `heroku run rake db:migrate`

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
