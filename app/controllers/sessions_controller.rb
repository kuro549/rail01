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
      #flash.now[:danger] = 'Invalid email/password combination'
      flash.now[:danger] = t 'app.errors.login.invalid_email_password'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end
