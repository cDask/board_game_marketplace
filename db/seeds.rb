# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Transaction.destroy_all
ListingPayment.destroy_all
Payment.destroy_all
Listing.destroy_all
Message.destroy_all
Conversation.destroy_all
Profile.destroy_all
User.destroy_all

puts 'DESTROYED ALL RECORDS'

puts 'SEEDING'
user = User.create(email: 'test@test.com', password: '12345678', is_admin: true)
puts 'ADMIN SEEDED'
profile = Profile.create(username: 'Admin',rating: 500,user_id: user.id)
puts 'PROFILE CREATED'

user2 = User.create(email: 'test@user.com', password: '12345678', is_admin: true)
puts 'USER SEEDED'
profile2 = Profile.create(username: 'Daniel',rating: 500,user_id: user2.id)
puts 'PROFILE CREATED'

conversation = Conversation.create(author_id: profile.id,receiver_id: profile2.id)
puts 'CONVERSATION CREATED'

message = Message.create(conversation_id: conversation.id, body: 'Hi',profile: profile)
puts 'TEST MESSAGE CREATED'

payment1 = Payment.create(name: 'Stripe')
payment2 = Payment.create(name: 'Cash')
puts 'PAYMENTS CREATED'

listing1 = Listing.create(
    board_game_name: 'Gaia Project',
    condition: 'Brand New in Shrink',
    listing_type: 'Money',
    price: 10000,
    board_game_trade: 'None',
    description: 'Awesome game',
    completed: false,
    profile: profile
)

listing2 = Listing.create(
    board_game_name: 'Gaia Project',
    condition: 'Brand New in Shrink',
    listing_type: 'Money',
    price: 10000,
    board_game_trade: 'None',
    description: 'Awesome game',
    completed: false,
    profile: profile2
)

listing1.payments << payment1
listing2.payments << payment2
puts 'PAYMENTS CREATED'