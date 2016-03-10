class AuthenticateController < ApplicationController
  def login
    @author = Author.new
    if request.post?
      author = Author.find_by(email: params[:email])

      if author && author.authenticate(params[:password])
        session[:author_id] = author.id
        redirect_to authors_path, notice: "Logged in!"
      else
        flash[:notice] = "Please try again"
      end
    end
  end

  def logout
    session[:author_id] = nil
    redirect_to authenticate_login_path, notice: "See ya!"
  end
end
