class SessionsController < ApplicationController
  def new
  end

  def google_login
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to "/chatrooms"
  end
 
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to "/chatrooms", :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"      
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
