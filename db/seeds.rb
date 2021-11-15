# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Author.create!([
  {
    first: 'J.K.',
    last: 'Rowling'
  },
  {
    first: 'Stephen',
    last: 'King'
  },
  {
    first: 'Mark',
    last: 'Twain'
  },
  {
    first: 'Ernest',
    last: 'Hemingway'
  },
  {
    first: 'Jane',
    last: 'Austen'
  },
  {
    first: 'Charles',
    last: 'Dickens'
  },
  {
    first: 'Virginia',
    last: 'Woolf'
  },
  {
    first: 'William',
    last: 'Shakespeare'
  },
  {
    first: 'Edgar Allan',
    last: 'Poe'
  },
  {
    first: 'John',
    last: 'Schatz'
  }
])
