# README

How fast can we get at rendering a Model's database column as JSON?

In this minimal Rails app, I tried to find out.

## Setup
* `bundle install`
* `bin/rails db:create db:migrate db:seed` <-- this will generate a ~500MB sized table and thus take a while
* `bin/rails server`
* Navigate your browser to `localhost:3000`
* Run `/bin/measure-endpoints` to measure different JSON rendering strategies on your machine 
