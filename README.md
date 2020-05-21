# README

- [README](#readme)
  - [Links](#links)
  - [Requirements](#requirements)
  - [Brief](#brief)
    - [Problem](#problem)
    - [User Stories](#user-stories)
  - [Design](#design)
    - [Wire frames](#wire-frames)
      - [Listings/Home page](#listingshome-page)
      - [Listing page](#listing-page)
      - [Add Listing](#add-listing)
      - [Sign up](#sign-up)
      - [Sign in](#sign-in)
      - [Messages](#messages)
      - [Profile](#profile)
      - [Edit Profile](#edit-profile)
      - [Admin Dashboard](#admin-dashboard)
  - [Database](#database)
    - [Entity Relationship Diagram](#entity-relationship-diagram)
  - [Implementation](#implementation)
    - [Models](#models)
    - [Abstraction](#abstraction)
    - [Third Party Services](#third-party-services)
    - [Task Management](#task-management)
      - [Day 1 - Monday 11/05/2020](#day-1---monday-11052020)
      - [Day 2 - Tuesday 12/05/2020](#day-2---tuesday-12052020)
      - [Day 3 - Wednesday 13/05/2020](#day-3---wednesday-13052020)
      - [Day 4 - Thursday 14/05/2020](#day-4---thursday-14052020)
      - [Day 5 - Friday 15/05/2020](#day-5---friday-15052020)
      - [Day 6 - Saturday 16/05/2020](#day-6---saturday-16052020)
      - [Day 7 - Sunday 17/05/2020](#day-7---sunday-17052020)
      - [Day 8 - Monday 18/05/2020](#day-8---monday-18052020)
      - [Day 9 - Tuesday 19/05/2020](#day-9---tuesday-19052020)
      - [Day 10 - Wednesday 20/05/2020](#day-10---wednesday-20052020)
      - [Day 11- Thursday 21/05/2020](#day-11--thursday-21052020)
      - [Day 11- Thursday 21/05/2020 -FINAL](#day-11--thursday-21052020--final)
  - [End Product](#end-product)
    - [Purpose](#purpose)
    - [Functionality / features](#functionality--features)
    - [Sitemap](#sitemap)
    - [Screenshots](#screenshots)
      - [Listings/home Page](#listingshome-page-1)
      - [Listing Show Page](#listing-show-page)
      - [User Dashboard](#user-dashboard)
      - [Conversations](#conversations)
      - [Chat](#chat)
      - [Transaction](#transaction)
    - [Target audience](#target-audience)
    - [Tech stack (e.g. html, css, deployment platform, etc)](#tech-stack-eg-html-css-deployment-platform-etc)

## Links

[Find the Github link here](https://github.com/cDask/board_game_marketplace)

[Find the website link here](https://boardgamesoverflow.herokuapp.com/)

## Requirements

In order to run this application a few credentials are required as they are not provided with this submission. 

This project makes use of the Stripe API and as such stripe credentials are required to run it.

This project also makes use of AWS S3 bucket for photo storage but has been configured to hold images locally in development however AWS credentials may be required.

## Brief

### Problem

As a passionate board gamer I have been part of a facebook board game group for quite sometime and have realised there is quite a large market for selling and buying new and second hand board games. This board game group is quite small and exclusive to australia only. Its all based on honour rules and listings are structured in the form of posts where anyone wanting to sell something takes a picture or few and post them with a description and price of the games being offered. They would also specify if they rather trade for another game as well whether they only want locals that has the ability pick up the game without postage.

Although its a great place to find board games it has many drawbacks. First of all its all cash transaction or bank transfer arranged between the buying and selling parties. The posting on the page is temperamental with people often having trouble with images and getting their text approved by facebook. Another problem is, there is no sorting and poor searching meaning that if you post something and nobody sees it may get buried in other posts and make it even harder for people who are interested in getting your game miss it completely. There is also barely any uniformity or structure meaning each post may be different and can be difficult to navigate as well as understand whats being offered.

As described above a more dedicated platform would be useful and is the reason for the development of my market place. Although there are many out there a lot of them are quite hard to navigate or not focused on the selling and buying and therefore buried deeper in their website (such as boardgamegeek.com). Hopefully my solution will give a clean simple and easy way to post and sell your board games online, with easier navigation and different payment options.

### User Stories

User stories help determine the functionality and purpose of the app and are listed below:

- As a board game enthusiast, I should be able to peruse the different listings and board games on offer without having to sign in, so that I can easily determine if there is something I would like to buy.

- As a board game collector, I should be able to message sellers to ask questions about their games. This is so I can understand the condition of the game better or to arrange delivery/pickup with seller in case I purchase the game.

- As a signed in user, I want to be able to find and see my conversations so I can easily get back to them.

- As a signed in user I would like to be able to view my transaction history and listings so I can keep track on what I have bought and listed.

- As a board game seller, I want to be able to upload one or many pictures of my boardgames to easily show potential buyers clearly the game on sale.
  
- As a buyer, I want to be able to see the rating of sellers in order to determine if they are trustworthy.
  
- As a board game seller, I should be able to sign up so that I feel my listings are secure and cant be tampered with unless they have my login.
  
- As a board game seller, I should be able to list my board game as a trade, in case I would rather get a new game than to get cash.

- As a board game seller, I want to be able to post my games with a choice of payment options so that I may choose a payment option im comfortable with.

- As a user, I would like to be able to filter the results or search for specific boardgames so I can easily find what im looking for.

- As a admin, I want to be able to manage all records this is so I can easier manage the website and find and help with any problems that arise.

## Design

### Wire frames

Below are all the wire frames made at the start of the project. The design has changed slightly the how and why are explained below each image.

#### Listings/Home page

![Listing/Home Page](./docs/Listings.png)

The thing that has changed the most is the navbar. First of all the large user icon has been removed, the links has been reduced and shifted to be together at the top, apart from the user which is still situated at the bottom. As for the mobile view its stayed the same apart from changing some of the navigation option and the omission of a logo. 

Most of the these changes was to reduce clutter and make it more minimalist to both look at and design. The logo image was never implemented due to time constraints as had more pressing matters than design a logo.

As for the general listing page it has stayed relative the same. A banner has been added to make it less stale and. The card themselves are close to the production design apart from buttons being removed and the smaller images omitted. This again was to reduce the clutter and the information was too much to fit in the cards.

#### Listing page

![Listing](./docs/Listing.png)

This page stayed largely the same except text has been formatted better and a border and image a part to see all images has been added to the bottom. This is was to accommodate more images for each listing. Some stylistic changes were made such as borders to make it look nicer.

#### Add Listing

![Add a listing](./docs/Add_Listing.png)

This page has stayed the same with small style tweaks and removed the list type toggle as too time consuming to implement.

#### Sign up

![Sign up](./docs/Sign_Up.png)

This page has stayed the same with small style tweaks.

#### Sign in

![Sign in](./docs/Sign_In.png)

This page has stayed the same with small style tweaks.

#### Messages

![Messages](./docs/Messages.png)

The mobile version has stayed the same while the desktop has changed to look more like mobile version. This is because of it being too time consuming to implement a completely different view for larger screens.

#### Profile 

![Profile](./docs/Profile_Page.png)

This has stayed quite similar to the original design apart from tables being larger than anticipated requiring it to take up the whole width the screen.

#### Edit Profile

![Profile](./docs/Edit_Profile.png)

This page has stayed the same with small style tweaks and removed the image preview.

#### Admin Dashboard

![Admin Dashboard](./docs/Profile_Page_(Admin).png)

This page has been removed and a gem to handle the admin dashboard is being used. This was easier to implement and allowed for greater controls and oversight for admins.

## Database

### Entity Relationship Diagram

The ERD can be found [here](https://dbdiagram.io/d/5eb9db1139d18f5553ff0b7f)

![ERD](./docs/erd.png)

The ERD above shows how my database will be implemented. Each table holds specific information relating to that table and is linked such that minimal repetition of data is done.

First we have the User table and Profile table this represents the user of the application and holds relevant data. The User table is more specifically for security and general role in the application (Admin or not admin) while Profile is to hold the more social aspect such as Profile pic username and the their rating.

The Listing table represents the board games that are to be sold traded and sold on the website and such holds all relevant information in regards to this this including name, condition, description, price or board game trade and payment options. payment options has been separated to its own table so that more options can be added later. It also has listing type that specify if its a trade or sell listing. It also holds some booleans such as completed and deleted to help determine its state.

The Listing table is then connected to a transaction table. A transaction record is only to be created once a listing has been bought and is used to record this. This table holds a profile and a listing as well as a rating. The listing represents the board game being sold and the profile the buyer. The rating is variable which is to allow users to rate their buying experience with people. This is to discourage scams and bad manners as a lot of transaction are still to be at peoples own risk.

The picture table is to represent the AWS S3 bucket which will hold all the pictures people upload. This is a polymorphic table that could belong to any other table but in this case only profiles and listings will utilise this. Profile will have one picture their profile pic while listing may have many pictures of their listings.

On the other side of the ERD we have the tables associated with the internal messaging system. The first table being the conversations table. This is a simple messaging system where people can only have 1 on 1 private conversations. Each conversations hold two profiles one for each participant as well as all messages that pertain to that conversation. The messaging table then holds the user sending the message, message body and the conversation which the message belongs to.


## Implementation

### Models

As seen from above each table has been implemented as models in the rails app. Below is a descriptions of each model and its relationships.

- User - This is the authentication model that handles passwords usernames and admin status its main purpose is that it functions as an entry point for users and to provide secure access to the website. It has one relationship with the profile model. A User has one Profile and a profile is dependent on a User.
- Profile - This model holds the more general information about our users such as profile pic and current rating and username. This is to give a more personalised experience when using the website. Profile belongs to one User and is dependent on having a User model attached to it. Profile is also associated with the Conversation, Message, Listing, Transaction and ActiveStorage models. Each of these relationships are has_many apart from ActiveStorage which holds the profile pic on AWS is a has_one
- Listing - Listing models holds listing information or the board games which are to be sold or traded. Each Listing belongs to a Profile which signify the poster of that Listing. Listing also has a many to many relationships with the Payment model through a join table. This is so a Listing can have many different payment options and each Payment options can have many Listings. Listing also has a has one relationship with Transaction model which signify each Listing only being sold once.
- Payments - The Payments model simply hold the payment options and provide them as options for the Listing model. It has been separated as a model rather than an enumerable as this allows for the addition of more payment types in the future such as google pay and paypal.
- ListingPayments - This is a join table that allows for the many to many relationships between Payments and Listings. It belongs to one listing and one Payment.
- Transaction - The transaction model represents the purchase or trade of a Listing and as such belongs to one Listing of which represents the product being sold and one Profile representing the buyer of that product. This model is only generated once a Listing has been purchased.
- Conversations - This model represents the Conversations taking place between two different individual Profiles as such it has a belongs to relationship with two different Profile models. It also has a has many relationship with the Message model that holds the messages being sent from the participants of the conversation.
- Message - The Message model holds the messages for conversations and belongs to one Conversation and one Profile. The Profile represents the messenger and Conversation is the conversation this message is part of.

### Abstraction

The final marketplace makes use of several different high-level components that ruby on rails provide, each making development and the functionality of the app vastly faster and broader.

One crucial abstraction used in my board game market place is how all my models are 
inherited from the application record class which in turn inherits from the base class in ActiveRecord module. What this allows us to do is set a model without having to write a bunch of code to implement basic functionality such as creating a new record or updating a new record, this is all created and handled by Rails. It also allows us to connect and make changes to our database with out having to code that logic ourselves. For example:

```Ruby

# Lets say we have a Listing model because of the use of abstraction we have access to the create model in which we didn't write ourselves but inherited from other classes. This method allows to make a new record in our database and populate it with variables we determined when creating the model.
listing = Listing.create()

# This example allows us to search our model for a record with id 2.
Listing.find(2)

```
Basically ActiveRecord in itself is an abstraction of SQL.

Another module we use for abstraction is the ActionView. The ActionView module handles the web request we are sent and compiles our views based on what the controller gives us. ActionViews is what handles all our views which are written in html with embedded ruby. Embedded ruby is what allows us to write ruby code among html which gives our view a wider functionality such as loops and conditionals. ActionViews also provides us with a bunch of helper methods such as form_with. These methods allow us to much easier display or request data through our views from our controller. All these functionality is possible thanks to abstraction through ActionView.

Action Controller is the third module we most commonly use in a Ruby on rails project. The Action Controller handles the C part of MVC and gives us as a developer a bunch of handy tools that allows us makes the development of apps faster. One of the main purposes of the Action Controller is to handle the RESTful aspect of our applications so we don't necessarily have to worry about it. It also sets up the logic and code for us to easily communicate with our view and models from our controllers.

### Third Party Services

A lot of the functionality of the market place has been implemented from various sources in order to provide a more secure and nicer user experience. Listed below are all the services being used in this project:


- Heroku - Heroku is a web server provider where the app has been deployed and uploaded. This is the server which user request from when visiting the website.
- AWS S3 Bucket - Amazons S3 bucket has been used to store resources such as user uploaded images. This is to ensure much faster performance and a smaller application footprint than storing it on the webserver.
- Stripe - To better handle sensitive credit card information and to stay compliant and secure, stripe has been used as a third party service that handles all credit card transaction and encryptions.
- Ultrahook - This was used to test web hooks for local stripe actions.
- Devise - Devise is a ruby gem which offers us User functionality with hashed password. This provides a much more secure solution to password protection and account creation.
- CanCanCan - CanCanCan is a ruby gem that allows us to manage access of our website so that unauthorized access isn't being made by malicious individuals. This provides our website with better security and a smoother user experience.
- Rspec - Rspec is a Ruby testing library which has been implemented and used briefly to make unit testing for models implemented. This ensures correct user functionality and better quality assurance.
- Rubocop - Rubocop is a Ruby linter that has been used in order to make sure code adhere to a uniform structure. This ensures more organised cleaner code which is less prone to errors.
- Ransack - A ruby gem known as ransack was used in order to implement the search function available within the app
- Rails Admin - Rails admin gives us a admin dashboard for our admin users. This gives the admins greater control of the database and websites.

### Task Management

[Trello Link](https://trello.com/invite/b/IUWYg4N3/1d7a1641ef05f02b23a42142253cdd1c/t2a2-marketplace-project)

Trello was used to manage tasks. Any time a new task came to light it was added to the To Do column and when something was being worked was put in the Doing column, if it was code related and testable it was put into Testing and moved to done when all test passed. This however was only done for certain models tasks. Any task that was seen unnecessary or too complex was put in Postponed to be worked on perhaps after project deadline. Each task was labeled depending on what the task involved and some task was given checklist as it require sub tasks. The labels were:

- Code - This specify a task required coding
- Structure - This task involved adding or structuring the code or project, often involving command lines.
- Design - This task involved anything to do with aesthetics
- Project Management - A PM task often involved documentation or the management of the project
- Bug - This specified a task that involved fixing a problem or error

Each morning a screenshot was taken and can be viewed below:

#### Day 1 - Monday 11/05/2020

![Day 1 screenshot](./docs/Screenshot_2020-05-11.png)

#### Day 2 - Tuesday 12/05/2020

![Day 2 screenshot](./docs/Screenshot_2020-05-12.png)

#### Day 3 - Wednesday 13/05/2020

![Day 3 screenshot](./docs/Screenshot_2020-05-13.png)

#### Day 4 - Thursday 14/05/2020

![Day 4 screenshot](./docs/Screenshot_2020-05-14.png)

#### Day 5 - Friday 15/05/2020

![Day 5 screenshot](./docs/Screenshot_2020-05-15.png)

#### Day 6 - Saturday 16/05/2020

![Day 6 screenshot](./docs/Screenshot_2020-05-16.png)

#### Day 7 - Sunday 17/05/2020

![Day 7 screenshot](./docs/Screenshot_2020-05-17.png)

#### Day 8 - Monday 18/05/2020

![Day 8 screenshot](./docs/Screenshot_2020-05-18.png)

#### Day 9 - Tuesday 19/05/2020

![Day 9 screenshot](./docs/Screenshot_2020-05-19.png)

#### Day 10 - Wednesday 20/05/2020

![Day 10 screenshot](./docs/Screenshot_2020-05-20.png)

#### Day 11- Thursday 21/05/2020

![Day 11 screenshot](./docs/Screenshot_2020-05-21.png)

#### Day 11- Thursday 21/05/2020 -FINAL

![Day 11 final screenshot](./docs/Final-trello.jpg)

## End Product

### Purpose

The purpose of this project was to create a marketplace in which board games could be sold and bought/traded by different individuals

### Functionality / features

The final application has the following features

- Account sign up / sign in - User can create accounts
- List a board game - A user can make a board game listing in order to sell or trade a game
- Buy a board game - A user can buy a listed board game
- Stripe integration - In order to accept card payment Stripe has been implemented allowing users to pay with the use of credit card
- Search function - Listings can be searched based on title description listing type or condition
- Admin control panel - Admin can interact with the website through the use of an extensive admin panel
- Messaging - A basic 1 to 1 messaging system has been implemented allowing users to message one another
- Picture upload - Listing and profiles allow for picture uploading that is later stored on AWS
- Profile Creation - Users can make a profile with a username and profile pic
- Rating system - Users can rate their transactions to better get an understanding of legitimate sellers
- User Dashboard - Users can get an overview of their past transactions and current and former listings.
- Admin Dashboard - A comprehensive dashboard has been implemented for admin to monitor the data of the website

### Sitemap

The final product sitemap.

![sitemap](./docs/sitemap.png)

### Screenshots

These are screenshots of the final product

#### Listings/home Page

![Listings](./docs/final-listings.png)

#### Listing Show Page

![Listing](./docs/final-showing-listing.png)

#### User Dashboard

![User Dashboard](./docs/final-dashboard.png)

#### Conversations

![Conversations](./docs/final-conversations.png)

#### Chat

![Chat](./docs/final-chat.png)

#### Transaction

![Transaction](./docs/final-transaction.png)

### Target audience

The target audience for this app is particularly people who are interested in buying and selling boardgames. Mainly targeted towards Australians but could be used by people around the world.

### Tech stack (e.g. html, css, deployment platform, etc)

Many different technologies was used to make this project and are listed below:

- Frontend
  - CSS/SASS
  - HTML with Embedded Ruby
  - JavaScript
- Backend
  - Ruby on Rails framework
  - PostgresSQL Database
- Deployment
  - Heroku
  - Git and Github
- Services
  - AWS S3 Bucket
  - Stripe