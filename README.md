##LIBRARY

This is a Rails 5 app.

## Documentation

This README describes the purpose of this repository and how to set up a development environment. Other sources of documentation are as follows:

## Prerequisites

This project requires:

* Ruby 2.5.3, preferably managed using [rbenv]
* Rails 5.2.3
* PostgreSQL must be installed and accepting connections

## Getting started

Please follow the steps to setup:

1.) Install ruby version 2.5.1
2.) Install rails version 5.2.0
3.) Install postgresql
4.) On the project root directory:
  a.) Run `bundle install`
  b.) rename database.yml.example to database.yml
  c.) Run `rake db:create`
  d.) run `rake db:migrate`
5.) run `rails s`

### bin/setup

Run the `bin/setup` script. This script will:

* Check you have the required Ruby version
* Install gems using Bundler
* Create local copies of `.env` and `database.yml`
* Create, migrate, and seed the database


## API endpoints

1. Fetch External Books

  Request-> GET /api/v1/external-books

2. To Create a Book In Development Database

  Request-> POST /api/v1/books
  params ->   {
                "notebook": {
                  "name":     "Testname",
                  "isbn":     "Testisbn",
                  "authors":  ["TestAuthor1", "TestAuthor2"],
                  "country":  "India",
                  "number_of_pages": 20,
                  "publisher": "Testpublisher"
                  }
              }

3. READ from Database

  Request->  GET /api/v1/books

4. READ a particular Record

  Request-> GET /api/v1/books/:id

5. Update a Record In Database

  Request-> PATCH /api/v1/books/:id
          POST /api/v1/books/:id/update

  params ->   {
              "notebook": {
                "name":     "Testname",
                "isbn":     "Testisbn",
                "authors":  ["TestAuthor1", "TestAuthor2"],
                "country":  "India",
                "number_of_pages": 20,
                "publisher": "Testpublisher"
                }
            }

6. Delete a Record

  Request-> DELETE /api/v1/books/:id
          POST /api/v1/books/:id/delete
