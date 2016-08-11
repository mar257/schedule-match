class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(username: params[:username])

    if user.nil?
      redirect_to new_session_path
      return
    end

    user = user.authenticate(params[:password])

    if user
      #LOGGED IN
      session[:user_id] = user.id
      redirect_to user
    else
      #INVALID LOGIN
      redirect_to new_session_path
    end
  end

  def destroy
  end
end
