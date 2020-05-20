# README

## Brief

### Problem

As a strong board gamer I have been part of a faceboook board game group for quite sometime and have realised there is quite a large market for selling and buying new and second hand board games. This board game group is quite small and exclusive to australia only. Its all based on honour rules and posts where anyone wanting to sell something takes a picture or few and post them with description of the game and prices offering. They would also specify if they rather trade for another game and if they only want locals that can pick up or willing to post interstate.

Although its a great place to find board games it has many drawbacks. First of all its all cash transaction or bank transfer arranged between the buying and selling parties. The posting on the page is temperamental with people often having trouble with images and getting their text approved by facebook. Another problem is there is no sorting and poor searching meaning that if you post something and nobody sees it may get buried in other posts and make it even harder for people who are interested in getting your game miss it completely.

As described above a more dedicated platform would be useful and is the reason for the development of my market place. Although there are many out there many can be quite hard to navigate or not focused on the selling and buying and therefore buried in a website (such as boardgamegeek.com). Hopefully my solution will give a clean simple and easy way to  post and sell your board games online. With easier navigation and different payment options.


## Implementation

### Abstraction

The final marketplace makes use of several different high-level components that ruby on rails provide, each making development and the functionality of the app vastly faster and broad.

One crucial abstraction used in my board game market place is how all my models are 
inherited from the application record class which in turn inherits from the base class in ActiveRecord module. What this allows us to do is set a model without having to write a bunch of code to implement basic functionality such as creating a new record or updating a new record, this is all created and handled by Rails. It also allows us to connect and make changes to our database with out having to code that logic ourselves. For example:

```Ruby

# Lets say we have a Listing model because of the use of abstraction we have access to the create model in which we didn't write ourselves but inherited from other classes. This method allows to make a new record in our database and populate it with variables we determined when creating the model.
listing = Listing.create()

# This example allows us to search our model for a record with id 2.
Listing.find(2)

```

Another module we use for abstraction is the ActionView. The ActionView module handles the web request we are sent and compiles our views based on what the controller gives us. ActionViews is what handles all our views which are written in html with embedded ruby. Embedded ruby is what allows us to write ruby code among html which gives our view a wider functionality such as loops and conditionals. ActionViews also provides us with a bunch of helper methods such as form_with. These methods allow us to much easier display or request data through our views from our controller.

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

PAPPA TYCKER

Listing ska va home

Ska sta sell och price

pay with card does nothing when not logged in

paying with card doesn't show correct transaction