class UserroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "userroom_channel_#{params[:receiver_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
