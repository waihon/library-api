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

* `bundle install`
* `bin/rails g model user email:string username:string password_digest:string`
* `bin/rails db:migrate`
