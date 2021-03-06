class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private def authenticate
    if session[:author_id].nil?
      redirect_to authenticate_login_path, notice: "Please log in before trying to access that page!"
    end
  end
end
