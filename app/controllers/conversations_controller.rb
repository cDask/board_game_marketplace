class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation, except: [:index]
  before_action :check_participating!, except: [:index]
  load_and_authorize_resource

  def index
    # Get all conversation involving current user
    @conversations = Conversation.participating(
      current_user.profile
    ).order('updated_at DESC')
  end

  def show
    # Get an new message as template
    @message = Message.new
  end

  private

  def set_conversation
    # get the current convsation and its messages to be displayed
    @conversation = Conversation.includes(:messages).find_by(id: params[:id])
  end

  def check_participating!
    return if @conversation && @conversation.participates?(current_user.profile)

    flash[:alert] = 'Unauthorized Access'
    redirect_to root_path
  end
end
