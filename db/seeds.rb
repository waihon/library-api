# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

rowling = Author.create!(first: 'J.K.', last: 'Rowling')
king = Author.create!(first: 'Stephen', last: 'King')
twain = Author.create!(first: 'Mark', last: 'Twain')
hemingway = Author.create!(first: 'Ernest', last: 'Hemingway')
austen = Author.create!(first: 'Jane', last: 'Austen')
dickens = Author.create!(first: 'Charles', last: 'Dickens')
woolf = Author.create!(first: 'Virginia', last: 'Woolf')
shakespeare = Author.create!(first: 'William', last: 'Shakespeare')
poe = Author.create!(first: 'Edgar Allan', last: 'Poe')
schatz = Author.create!(first: 'John', last: 'Schatz')
clancy = Author.create!(first: 'Tom', last: 'Clancy')

Book.create([
  {
    title: "For Whom the Bell Tolls",
    isbn: "978-0684803357",
    publish_date: "1995-07-01",
    author: hemingway
  },
  {
    title: "The Old Man and the Sea",
    isbn: "0684801221",
    publish_date: "1995-05-05",
    author: hemingway
  },
  {
    title: "The Dark Tower: The Gunslinger",
    isbn: "978-0937986509",
    publish_date: "1998-01-01",
    author: king
  },
  {
    title: "The Green Mile",
    isbn: "978-0671041786",
    publish_date: "1999-11-01",
    author: king
  },
  {
    title: "Harry Potter and the Chamber of Secrets",
    isbn: "0439064872",
    publish_date: "2000-09-01",
    author: rowling
  },
  {
    title: "The Adventures of Tom Sawyer",
    isbn: "979-8749478112",
    publish_date: "2021-05-05",
    author: twain
  },
  {
    title: "Pride and Prejudice",
    isbn: "978-0141439518",
    publish_date: "2002-12-31",
    author: austen
  },
  {
    title: "Clear and Present Danger",
    isbn: "0399134409",
    publish_date: "1989-08-01",
    author: clancy
  }
])
