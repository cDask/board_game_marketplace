class PaymentsController < ApplicationController
  before_action :authenticate_user!, except: [:webhook]
  skip_before_action :verify_authenticity_token, only: [:webhook]

  def stripe_id
    @listing = Listing.find(params[:id])
    session_id = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: stripe_variables(@listing),
      payment_intent_data: payment_intent(@listing),
      success_url: "#{root_url}listings/#{@listing.id}/transactions/new",
      cancel_url: "#{root_url}listings"
    ).id
    render_json(session_id)
  end

  def webhook
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    listing_id = payment.metadata.listing_id
    user_id = payment.metadata.user_id
    listing = Listing.find(listing_id)
    user =  User.find(user_id)
    transaction = listing.transactions.new(profile: user.profile)
    transaction.save

    head 200
  end

  def render_json(id)
    render json: {
      id: id,
      stripe_public_key: Rails.application.credentials.dig(:stripe, :public_key)
    }
  end

  def stripe_variables(listing)
    [{
      name: listing.board_game_name,
      description: listing.description,
      amount: listing.price,
      currency: 'aud',
      quantity: 1
    }]
  end

  def payment_intent(listing)
    {
      metadata: {
        user_id: current_user.id,
        listing_id: listing.id
      }
    }
  end
end
