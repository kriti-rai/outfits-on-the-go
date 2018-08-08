class UsersController < ApplicationController
  before_action :set_user, only: [:create, :edit, :update]

  def new
    @user = User.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private
    def set_user
      @user = User.find_by(params[:id])
    end
end
