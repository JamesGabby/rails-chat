class ChatroomController < ApplicationController
  def index
    @message = Message.all
  end
end
