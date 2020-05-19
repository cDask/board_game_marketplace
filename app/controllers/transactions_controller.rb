class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_listing, except: [:new]

  def new
    @listing = Listing.with_attached_pictures.includes(
      :transactions
    ).find(params[:listing_id])
    @transaction = @listing.transactions.first
  end

  def show
    @listing = Listing.includes(:transactions).find(params[:listing_id])
    @transaction = @listing.transactions.first
  end

  def create
    @transaction = Transaction.new(
      listing_id: params[:listing_id], profile: current_user.profile
    )
    if @transaction.save
      send_automated_message(@listing)
    else
      flash[:alert] = 'Something Went Wrong'
      render listing_path(params[:listing_id])
    end
    redirect_to new_listing_transaction_path
  end

  private

  def payment_intent
    {
      metadata: {
        user_id: current_user.id,
        listing_id: @listing.id
      }
    }
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
