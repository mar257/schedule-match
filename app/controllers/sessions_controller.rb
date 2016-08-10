class SessionsController < ApplicationController
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
      redirect_to user
    else
      redirect_to new_session_path
    end
  end

  def destroy
  end
end
