class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(message_params)
    message.receiver_id = params[:receiver_id]

    if message.receiver_id && message.save!    
      ActionCable.server.broadcast "userroom_channel", { user_message: message_render(message), receiver_id: message.receiver_id, sender_id: current_user.id }
    elsif message.receiver_id == nil && message.save! 
      ActionCable.server.broadcast "chatroom_channel", chatroom_message: message_render(message)
    else
      flash[:error] = "Something went wrong."
      redirect_to root_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :receiver_id, :user_id)
  end

  def message_render(message)
    render(partial: 'message', locals: { message: message })
  end
end
