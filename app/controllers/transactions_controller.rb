class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_profile
  before_action :find_listing, except: %i[rating]

  def new
    @transaction = @listing.transactions.last
    return unless @transaction.nil?

    flash[:alert] = 'Payment Failure'
    redirect_to @listing
  end

  def show
    # Get the listing
    @listing = Listing.with_attached_picture.includes(
      :transactions
    ).find(params[:listing_id])
    @transaction = @listing.transactions.last
  end

  def create
    # Create a new listing
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

  def rating
    # Get the transaction with its listing to update the rating
    @transaction = Transaction.includes(:listing).find(params[:id])
    if params[:rating].empty?
      flash[:alert] = 'Please enter a rating'
    else
      @transaction.rating = params[:rating]
      flash[:alert] = 'Transactions didnt save' unless @transaction.save
    end
    redirect_to listing_transaction_path(@transaction.listing.id)
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
    # Get the listing with images and connected transaction
    @listing = Listing.with_attached_picture.includes(
      :transactions
    ).find(params[:listing_id])
  end

  def send_automated_message(_listing)
    @listing.completed = true
    @listing.save
    # Gets the conversation between current user and the poster of the listing
    @conversation = Conversation.between(
      current_user.profile.id, @listing.profile.id
    )[0]
    # if conversation doesnt exist create a new one
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

  def sanitize_params
    params.permit(:id)
  end

  def check_profile
    return if current_user.profile

    flash[:alert] = 'Please create your profile first'
    redirect_to new_profile_path
  end
end
