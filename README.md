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

## Explain the different high-level components (abstraction)

- Describe the inheritance in the application
- ModeApplicationRecord <- ActiveRecord

One example of high level components in my rails app is Active Record. Active record is a module with the Base class inside of it that gives our models methods that allows us to manipulate our data.

Essentially, active record can be called on our models to create, read, update and delete. IN the background it's executing SQl that does this record manipulation

---
Active Storage is a module that allows me to upload files in a simple manner.

Action View

ERB

Difference between Template Review and Partials

Do 3 abstractions 2 paragraphs each about as long as above.

## Code comments

This action returns all of the listing records and sends them to the index vies

def index
    Listing.all
end

```Ruby
# Load every game and its publishers username
# only load active games

games = []
list = Game.with_attached_images.includes{publisher: [:user]}.select { |game| game.active == true }

```
## Q19 and Q14 combine

Schema requirements

You must have:

1.  A screenshot of your ERD from dbdiagram
2.  Text for how you created the dbdiagram
3.  Discuss why you



Slides Important that the app that is deployed to heroku is the app being demoed.

