class SessionsController < ApplicationController
  # Create a new log in (Sign up?)
  def new
  end

  # Create a log in session
  def create
    user = User.find_by(username: params[:session][:username])
    # If user is valid (found) and the user authenticates
    if user && user.authenticate(params[:session][:password])
      # In-built - creates a session for a user; Store the ID of a user in a session to keep track of the user
      session[:user_id] = user.id
      flash[:success] = "Welcome #{user.username}! You have successfully logged in."
      redirect_to root_path
    else
      # flash.now[] renders the flash immediately whereas flash[] renders it on the next render
      flash.now[:error] = "There was something wrong with your credentials."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out."
    redirect_to login_path
  end
end
