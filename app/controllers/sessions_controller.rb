class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      log_in(user)
      #redirect_to user_url(user)
      redirect_back_or (user_url(user))
    else
      flash.now[:danger] = t 'app.controllers.sessions_controller.dangerflash'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end
