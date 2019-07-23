class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(login_params)
    if user
      session[:user_id] = user.id
      redirect_to '/login'
      # redirect_to "/users/#{session[:user_id]}/posts"

    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  private

    def login_params
      params.require(:session).permit(:email, :password)
    end
end
