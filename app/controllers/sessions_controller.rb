class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to welcome_path
    else
      render 'new'
    end
  end

  def create
    if auth
      @user = User.find_or_create_by(auth)
      session[:user_id] = @user.id
      redirect_to @user
    else
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to @user
      else
        flash[:error] = "The username and password combination does not match our records."
        redirect_to signin_path
      end
    end
  end

  def destroy
    session.delete :user_id
    session[:user_id] = nil
    redirect_to root_url
  end

  private
    def auth
      request.env['omniauth.auth']
    end

end
