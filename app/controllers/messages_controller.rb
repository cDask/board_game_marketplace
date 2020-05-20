class MessagesController < ApplicationController
  before_action :find_conversation!

  def new
    redirect_to(conversation_path(@conversation)) && return if @conversation

    @message = current_user.profile.messages.new
  end

  def create
    # Create a new conversation between two people if it doesnt exist already
    @conversation ||= Conversation.create(author_id: current_user.profile.id,
                                          receiver_id: @receiver.id)
    if @conversation.id
      send_message
    else
      flash[:alert] = 'Cant start conversation with yourself'
      redirect_to root_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def find_conversation!
    if params[:receiver_id]
      conversation_receiver
    else
      # Get conversation based on parameters to display
      @conversation = Conversation.find_by(
        id: params[:conversation_id]
      )
      error_check
    end
  end

  def error_check
    return if @conversation && @conversation.participates?(current_user.profile)

    redirect_to(root_path) && return
  end

  def conversation_receiver
    # Get the Profile of the other person in the conversation
    @receiver = Profile.find_by(id: params[:receiver_id])

    redirect_to(root_path) && return unless @receiver

    # Get conversation between current user and another profile
    @conversation = Conversation.between(
      current_user.profile.id, @receiver.id
    )[0]
  end

  def send_message
    @message = current_user.profile.messages.new message_params
    @message.conversation_id = @conversation.id
    if @message.conversation_id
      @message.save!
      flash[:success] = 'Your message was sent!'
      redirect_to conversation_path(@conversation)
    else
      flash[:alert] = 'something wrong'
      redirect_to root_path
    end
  end
end
