# Objective
* A Rails app that will take an appID for Apple Store (an integer) or PlayStore (eg: com.facebook.katana) and return a json response that contains the folling app information:
    * app identifier id
    * app published name
    * publisher name
    * current version of app
    * release notes for current version
    * release timestamp for current version

# To Use
## On Heroku
* Go to the Heroku site [here](http://app-store-searcher.herokuapp.com/)
* Enter in an Apple Store ID (eg: 284910350) or a Google Play Store ID (eg: com.facebook.katana)
* Click 'Search!'

## On your own computer
* `git clone https://github.com/contrepoint/app_store_searcher`
* `bundle install` (Install all gems)
* `bundle exec rake db:create` (Create the database)
* `bundle exec rake db:migrate` (Migrate the database)
* `bundle exec rails s` (Start the rails server)
* Go to localhost:3000
* Enter in an Apple Store ID (eg: 284910350) or a Google Play Store ID (eg: com.facebook.katana)
* Click 'Search!'

# Tests
* In your terminal, go to the app's root folder
* Make sure all gems are installed (`bundle install` if you haven't already)
* `bundle exec rspec spec` will run all tests
    * You should get `7 examples, 0 failures`

