# README

## Brief

### Problem

As a strong board gamer I have been part of a faceboook board game group for quite sometime and have realised there is quite a large market for selling and buying new and second hand board games. This board game group is quite small and exclusive to australia only. Its all based on honour rules and posts where anyone wanting to sell something takes a picture or few and post them with description of the game and prices offering. They would also specify if they rather trade for another game and if they only want locals that can pick up or willing to post interstate.

Although its a great place to find board games it has many drawbacks. First of all its all cash transaction or bank transfer arranged between the buying and selling parties. The posting on the page is temperamental with people often having trouble with images and getting their text approved by facebook. Another problem is there is no sorting and poor searching meaning that if you post something and nobody sees it may get buried in other posts and make it even harder for people who are interested in getting your game miss it completely.

As described above a more dedicated platform would be useful and is the reason for the development of my market place. Although there are many out there many can be quite hard to navigate or not focused on the selling and buying and therefore buried in a website (such as boardgamegeek.com). Hopefully my solution will give a clean simple and easy way to  post and sell your board games online. With easier navigation and different payment options.

### User Stories

User stories help determine the functionality and purpose of the app and are listed below:

- As a board game enthusiast, I should be able to peruse the different listings and board games on offer without having to sign in, so that I can easily determine if there is something I would like to buy.
- As a board game collector, I should be able to message sellers to ask questions about their games. This is so I can understand the condition of the game better or to arrange delivery/pickup with seller in case I purchase the game.
- As a board game seller, I want to be able to upload one or many pictures of my boardgames to easily show potential buyers clearly the game on sale.
- As a buyer, I want to be able to see the rating of sellers in order to determine if they are trustworthy. 
- As a board game seller, I should be able to sign up so that I feel my listings are secure and cant be tampered with unless they have my login.
- As a board game seller, I should be able to list my board game as a trade in case I would rather get a new game than to get cash.
- As a board game seller, I want to be able to post my games with a choice of payment options to that I may choose a payment option im comfortable with.
- As a admin, I want to be able to manage all records this is so I can easier manage the website and find and help with any problems that arise.
## Database

### Entity Relationship Diagram


The ERD above shows how my database will be implemented. Each table holds specific information relating to that table and is linked such that minimal repetition of data is done.

First we have the User table and Profile table this represents the user of the application and holds relevant data. The User table is more specifically for security and general role in the application (Admin or not admin) while Profile is to hold the more social aspect such as Profile pic username and the their rating.

The Listing table represents the board games that are to be sold traded and sold on the website and such holds all relevant information in regards to this this including name, condition, description, price or board game trade and payment options. payment options has been separated to its own table so that more options can be added later. It also has listing type that specify if its a trade or sell listing. It also holds some booleans such as completed and deleted to help determine its state.

The Listing table is then connected to a transaction table. A transaction record is only to be created once a listing has been bought and is used to record this. This table holds a profile and a listing as well as a rating. The listing represents the board game being sold and the profile the buyer. The rating is variable which is to allow users to rate their buying experience with people. This is to discourage scams and bad manners as a lot of transaction are still to be at peoples own risk.

The picture table is to represent the AWS S3 bucket which will hold all the pictures people upload. This is a polymorphic table that could belong to any other table but in this case only profiles and listings will utilise this. Profile will have one picture their profile pic while listing may have many pictures of their listings.

On the other side of the ERD we have the tables associated with the internal messaging system. The first table being the conversations table. This is a simple messaging system where people can only have 1 on 1 private conversations. Each conversations hold two profiles one for each participant as well as all messages that pertain to that conversation. The messaging table then holds the user sending the message, message body and the conversation which the message belongs to.


## Implementation

### Models

As seen from above each table has been implemented as models in the rails app. Below is a descriptions of each model and its relationships.

- User - This is the authentication model that handles passwords usernames and admin status its main purpose is an entry point for users and to provide a secure way for user access the website. It has one relationship with the profile model in which a User has on Profile and a profile is dependent on User.
- Profile - This model holds the more general information about our users such as profile pic and current rating and username. This is to give a more personalised experience when using the website. Profile belongs to one User and is dependent on having a User model attached to it. Profile is also associated with the Conversation, Message, Listing, Transaction and ActiveStorage models. Each of these relationships are has_many apart from ActiveStorage which holds the profile pic on AWS is a has_one
- Listing - Listing models holds listing information or the board games which are to be sold or traded. Each Listing belongs to a Profile which signify the poster of that Listing. Listing also has a many to many relationships with the Payment model through a join table. This is so a Listing can have many different payment options and each Payment options can have many Listings. Listing also has a has one relationship with Transaction model which signify each Listing only being sold once.
- Payments - The Payments model simply hold the payment options and provide them as options for the Listing model. It has been separated as a model rather than an enumerable as this allows for addition of more payment types in the future such as google pay and paypal.
- ListingPayments - This is a join table that allows for the many to many relationships between Payments and Listings. It belongs to one listing and one Payment.
- Transaction - The transaction model represents the purchase or trade of a Listing as such belongs to one Listing of which represents the product being sold and one Profile representing the buyer of that product. This model is only generated once a Listing has been purchased.
- Conversations - This model represents the Conversations taking place between two different individual Profiles as such it has a belongs to relationship with two different Profile models. It also has a has many relationship with the Message model that holds the messages being sent from the participants of the conversation.
- Message - The Message model holds the messages for conversations and belongs to one Conversation and one Profile. The Profile represents the messenger and Conversation is the conversation this message is part of.

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

Another module we use for abstraction is the ActionView. The ActionView module handles the web request we are sent and compiles our views based on what the controller gives us. ActionViews is what handles all our views which are written in html with embedded ruby. Embedded ruby is what allows us to write ruby code among html which gives our view a wider functionality such as loops and conditionals. ActionViews also provides us with a bunch of helper methods such as form_with. These methods allow us to much easier display or request data through our views from our controller. All these functionality is possible thanks to abstraction through ActionView.


### Third Party Services

A lot of the functionality of the market place has been implemented from various sources in order to provide a more secure and nicer user experience. Listed all the services being used in this project:


- Heroku - Heroku is a web server provider where the app has been deployed and uploaded. This is the server which user request from when visiting the website.
- AWS S3 Bucket - Amazons S3 bucket has been used to store resources such as user uploaded images. This is to ensure much faster performance and a smaller application footprint than storing it on the webserver.
- Stripe - To better handle sensitive credit card information and to stay compliant and secure, stripe has been used as a third party service that handles all credit card transaction and encryptions.
- Devise - Devise is a ruby gem which offers us User functionality with hashed password. This provides a much more secure solution to password protection and account creation.
- CanCanCan - CanCanCan is a ruby gem that allows us to manage access of our website so that unauthorized access isn't being made by malicious individuals. This provides our website with better security and a smoother user experience.
- Rspec - Rspec is a Ruby testing library which has been implemented and used briefly to make unit testing for models implemented. This ensures correct user functionality and better quality assurance.
- Rubocop - Rubocop is a Ruby linter that has been used in order to make sure code adhere to a uniform structure. This ensures more organised cleaner code which is less prone to errors.




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