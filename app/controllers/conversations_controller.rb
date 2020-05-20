class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation, except: [:index]
  before_action :check_participating!, except: [:index]
  load_and_authorize_resource

  def index
    @conversations = Conversation.participating(
      current_user.profile
    ).order('updated_at DESC')
  end

  def show
    @message = Message.new
  end

  private

  def set_conversation
    @conversation = Conversation.find_by(id: params[:id])
  end

  def check_participating!
    return if @conversation && @conversation.participates?(current_user.profile)

    redirect_to root_path
  end
end
