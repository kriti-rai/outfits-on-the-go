class UsersController < ApplicationController
  before_action :find_user, only: [:create, :edit, :update]

  def new
    @user = User.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def find_user
      @user = User.find_by(params[:id])
    end
end
