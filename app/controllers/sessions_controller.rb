class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # logs the user in -
    #finds the user by params[:id]
    #if found, authenticates the user and logs them in (session[:id] = user.id)
    #if not found, redirects the user to login page

  end

  def destroy
    session.delete :id
    session[:id] = nil
    redirect_to root_url
  end

end
