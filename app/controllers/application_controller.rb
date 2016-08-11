class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user

  helper_method :current_user

  def current_user
    User.find_by(id: session[:user_id])
  end

  private

  def authenticate_user
    redirect_to new_session_path if current_user.nil?
  end
end
