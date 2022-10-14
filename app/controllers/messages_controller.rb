class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(message_params)
    user_id = message.user_id
    receiver_id = params[:receiver_id]
    # if message.save!    
    #   ActionCable.server.broadcast "chatroom_channel", mod_msg: message_render(message)
    # els
    if message.save!   
      ActionCable.server.broadcast "userroom_channel_#{receiver_id}",{ user_message: message_render(message), receiver_id: receiver_id }
    else
      flash[:error] = "Something went wrong."
      redirect_to root_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def message_render(message)
    render(partial: 'message', locals: { message: message })
  end
end
