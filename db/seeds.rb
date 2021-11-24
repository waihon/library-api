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
    isbn: "9780684803357",
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
    isbn: "9780937986509",
    publish_date: "1998-01-01",
    author: king
  },
  {
    title: "The Green Mile",
    isbn: "9780671041786",
    publish_date: "1999-11-01",
    author: king
  },
  {
    title: "The Adventures of Tom Sawyer",
    isbn: "9798749478112",
    publish_date: "2021-05-05",
    author: twain
  },
  {
    title: "Pride and Prejudice",
    isbn: "9780141439518",
    publish_date: "2002-12-31",
    author: austen
  },
  {
    title: "Clear and Present Danger",
    isbn: "0399134409",
    publish_date: "1989-08-01",
    author: clancy
  },
  {
    title: "Harry Potter and the Philosopher's Stone",
    isbn: "9780747532743",
    publish_date: "1997-06-26",
    author: rowling
  },
  {
    title: "Harry Potter and the Chamber of Secrets",
    isbn: "0747538492",
    publish_date: "1998-07-02",
    author: rowling
  },
  {
    title: "Harry Porter and the Prisoner of Azkaban",
    isbn: "0747542155",
    publish_date: "1999-07-08",
    author: rowling
  },
  {
    title: "Harry Potter and the Goblet of Fire",
    isbn: "074754624X",
    publish_date: "2000-07-08",
    author: rowling
  },
  {
    title: "Harry Potter and the Order of the Phoenix",
    isbn: "0747551006",
    publish_date: "2003-06-27",
    author: rowling
  },
  {
    title: "Harry Potter and the Half-Blood Prince",
    isbn: "0747581088",
    publish_date: "2005-07-16",
    author: rowling
  },
  {
    title: "Harry Potter and the Deathly Hallows",
    isbn: "0545010225",
    publish_date: "2007-07-14",
    author: rowling
  }
])
