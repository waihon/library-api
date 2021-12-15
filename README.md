# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Terminal Commands

### 3. Creating a Rails Project

* `rails new library-api --api`
* `cd library-api`
* `bundle install`
* `bin/rails server`

### 7. Rails: JSON API Resource Basics

* `bin/rails g migration CreateAuthors`
* `bin/rails db:migrate`

### 23. Ruby Author Filter

* `bin/rails db:seed:replant`

### 25 Rails Book Resource

* `bin/rails g model book title:string isbn:string publish_date:date author:references`
* `bin/rails g controller books`
* `bin/rails g jsonapi:resource book`
* `bin/rails db:migrate`

### 34. Rails Reviews Resource

* `bin/rails g model review user:string body:text book:references`
* `bin/rails g controller reviews`
* `bin/rails db:migrate`
* `bin/rails g jsonapi:resource reviews`

### 40. Storing Users Securely with BCrypt

* `bundle install` (after updating Gemfile)
* `bin/rails g model user email:string username:string password_digest:string`
* `bin/rails db:migrate`

### 41. Creating Sessions with JWTs

* `bundle install` (after updating Gemfile)
* `bin/rails secret` (to generate a secret string)

### 47. Adding Authorization to Create APIs

#### Terminal
* `bin/rails g migration AddUserIdToAuthors user:references`
* `bin/rails g migration AddUserIdToBooks user:references`
* `bin/rails db:migrate`

#### Rails Console
* `Author.update_all(user_id: 1)`
* `Book.update_all(user_id: 1`)

### 48. Adding Computed Attributes to APIs

#### Terminal
* `bin/rails g migration AddUserIdToReviews user:references`
* `bin/rails db:migrate`
* `bin/rails db:rollback`
* `bin/rails db:migrate` (after editing the latest migration file)
* `bundle install` (after updating Gemfile to use jsonapi-resources 0.9)

#### Rails Console

* `Review.update_all(user_id: 1)`

### 54 Deploying Rails with Heroku

#### Terminal
* `sqlite3 db/development.sqlite3 -csv -header 'SELECT * FROM users;' > db/users.csv`
* `sqlite3 db/development.sqlite3 -csv -header 'SELECT * FROM authors;' > db/authors.csv`
* `sqlite3 db/development.sqlite3 -csv -header 'SELECT * FROM books;' > db/books.csv`
* `sqlite3 db/development.sqlite3 -csv -header 'SELECT * FROM reviews;' > db/reviews.csv`
* `bin/rails db:create`
* `bin/rails db:migrate`
* `psql -d library-api -c "copy users from '$(pwd)/db/users.csv' CSV HEADER"`
* `psql -d library-api -c "copy authors from '$(pwd)/db/authors.csv' CSV HEADER"`
* `psql -d library-api -c "copy books from '$(pwd)/db/books.csv' CSV HEADER"`
* `psql -d library-api -c "copy reviews from '$(pwd)/db/reviews.csv' CSV HEADER"`

#### PostreSQL
* `SELECT setval('users_id_seq', (SELECT MAX(id) FROM users));`
* `SELECT setval('authors_id_seq', (SELECT MAX(id) FROM authors));`
* `SELECT setval('books_id_seq', (SELECT MAX(id) FROM books));`
* `SELECT setval('reviews_id_seq', (SELECT MAX(id) FROM reviews));`

#### Heroku
* `heroku create elibapi`
* `git push heroku main`
* `heroku config:set JWT_SECRET=$(rails secret)`
* `heroku addons:create heroku-postgresql:hobby-dev`
* `heroku pg:push library-api DATABASE_URL`
* `heroku open`
* `heroku pg:reset`
* `heroku run "rails db:migrate"`
