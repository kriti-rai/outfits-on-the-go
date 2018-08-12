class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]

  def new
    @user = User.new
  end

  def create
    if auth
      @user = User.find_or_create_by(auth)
    else
      @user = User.new(user_params)
    end

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Logged in succesfully"
      redirect_to feed_path
    else 
      flash[:error] = @user.errors.full_messages[0]
      render 'new'
    end
  end

  def edit
    if @user == current_user
      render 'edit'
    else
      flash[:error] = "Access denied"
      redirect_to welcome_path
    end
  end

  def update
    @user.update(user_params)
    redirect_to @user
  end

  def show
    @boards= @user.boards
  end

  def index
    @users = User.all
  end

  def destroy
    #only the user themselves can destroy their acc
    @user = User.find(params[:id])
    if @user = current_user
      @user.destroy
      redirect_to root_url
    else
      flash[:error] = "Access denied"
      redirect_to welcome_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :email_address, :password, :bio)
    end

    def set_user
      @user = User.find_by_id(params[:id])
    end


end
