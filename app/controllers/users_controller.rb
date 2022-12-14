class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to Chat App #{@user.username}!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @message = Message.new
    @messages = Message.where(receiver_id: [@user.id, current_user.id], user_id: [@user.id, current_user.id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
