class UsersController < ApplicationController
  before_action :set_user, only: [:create, :edit, :update, :show]

  def new
    @user = User.new
  end

  def create
    # raise params.inspect
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url
    else
      flash[:error] = @user.errors.full_messages[0]
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def show
    @boards= @user.boards
  end

  def destroy
  end

  private
    def set_user
      @user = User.find_by(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email_address, :password, :bio)
    end
end
