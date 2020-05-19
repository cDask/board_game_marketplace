class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_listing, except: [:new]

  def new
    @listing = Listing.includes(:transactions).find(params[:listing_id])
    @transaction = @listing.transactions.first
  end

  def create
    if params[:payment] == 'Cash'
      create_transaction
      redirect_to new_listing_transaction_path
    elsif params[:payment] == 'Stripe'
      create_transaction
      respond_to do |format|
        format.js { render js: 'stripeFunction();' }
      end
    end
  end

  def stripe_id
    @listing = Listing.find(params[:listing_id])
    session_id = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: line_items,
      payment_intent_data: payment_intent,
      success_url: "#{root_url}listing/
      #{@listing.id}/transactions/
      #{@transaction_id}",
      cancel_url: "#{root_url}listings"
    ).id
    render_json(session_id)
  end

  private

  def render_json(session_id)
    render json: {
      id: session_id,
      stripe_public_key: Rails.application.credentials.dig(
        :stripe,
        :public_key
      )
    }
  end

  def payment_intent
    {
      metadata: {
        user_id: current_user.id,
        listing_id: @listing.id
      }
    }
  end

  def line_items
    [{
      name: @listing.board_game_name,
      description: @listing.description,
      amount: @listing.price,
      currency: 'aud',
      quantity: 1
    }]
  end

  def create_transaction
    @transaction = Transaction.new(
      listing_id: params[:listing_id],
      profile: current_user.profile
    )
    if @transaction.save
      send_automated_message(listing)
    else
      flash[:alert] = 'Something Went Wrong'
      render listing_path(params[:listing_id])
    end
  end

  def find_listing
    @listing = Listing.find(params[:listing_id])
  end

  def send_automated_message(_listing)
    @listing.completed = true
    @listing.save
    @conversation = Conversation.between(
      current_user.profile.id, @listing.profile.id
    )[0]
    @conversation ||= Conversation.create(author_id: current_user.profile.id,
                                          receiver_id: @listing.profile.id)
    automated_message
    @message.conversation_id = @conversation.id
    @message.save!
  end

  def automated_message
    @message = current_user.profile.messages.new(
      profile: current_user.profile,
      body: "AUTOMATED MESSAGE:
          #{current_user.profile.username} just purchased
          #{@listing.board_game_name} from you,
            Contact them here to arrange for delivery "
    )
  end
end
