class SessionsController < ApplicationController
  def new
  end

  def create
    # logs the user in -
    #finds the user by params[:id]
    #if found, authenticates the user and logs them in (session[:id] = user.id)
    #if not found, redirects the user to login page
    # raise params.inspect
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash[:error] = "The username and password combination does not match our records."
      redirect_to new_session_path
    end
  end

  def destroy
    session.delete :user_id
    session[:user_id] = nil
    redirect_to root_url
  end

end
