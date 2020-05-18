class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @listing = Listing.includes(:transactions).find(params[:listing_id])
    @transaction = @listing.transactions.first
  end

  def create
    if params[:payment] == 'Cash'
      create_transaction
    elsif params[:payment] == 'Stripe'

    end
  end

  private

  def create_transaction
    @transaction = Transaction.new(
      listing_id: params[:listing_id],
      profile: current_user.profile
    )
    if @transaction.save
      transaction_steps
    else
      flash[:alert] = 'Something Went Wrong'
      render listing_path(params[:listing_id])
    end
  end

  def transaction_steps
    complete_listing
    send_autmated_message
    redirect_to new_listing_transaction_path
  end

  def complete_listing
    @listing = Listing.find(params[:listing_id])
    @listing.completed = true
    @listing.save
  end

  def send_automated_message
    @conversation = Conversation.between(
      current_user.profile.id, @listing.profile.id
    )[0]
    @conversation ||= Conversation.create(author_id: current_user.profile.id,
                                          receiver_id: @receiver.id)
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
