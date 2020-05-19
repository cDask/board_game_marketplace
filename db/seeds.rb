ListingPayment.delete_all
Transaction.destroy_all
Payment.destroy_all
Listing.destroy_all
Message.destroy_all
Conversation.destroy_all
Profile.destroy_all
User.destroy_all

puts 'DESTROYED ALL RECORDS'

puts 'SEEDING'
user = User.create(email: 'admin@bge.com', password: '12345678', is_admin: true)
puts 'ADMIN SEEDED'
profile = Profile.create(username: 'Admin',rating: 500,user_id: user.id)
puts 'PROFILE CREATED'

user2 = User.create(email: 'test@bge.com', password: '12345678')
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

profile_array = [profile2,profile]

9.times do 
    Listing.create(
        board_game_name: 'Gaia Project',
        condition: 'Brand New in Shrink',
        listing_type: 'Money',
        price: 10000,
        board_game_trade: 'None',
        description: 'Awesome game',
        completed: false,
        profile: profile_array[rand(0..1)]
    )
end

Listing.all.each do |l|
    l.payments << payment1
    l.payments << payment2
end
puts 'PAYMENTS CREATED'