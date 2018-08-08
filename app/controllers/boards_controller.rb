class BoardsController < ApplicationController
  before_action :require_login

  def new
    @board = Board.new
    # @user = current_user
    @board.user = current_user
  end

  def create
    #board needs to know that it belongs to a user
    #board needs to know if it has any outfits (edit?)
    #only allowed to create if a user is logged in
    @board = Board.create(name: params[:board][:name], user_id: current_user.id)
    # @user = current_user
    # binding.pry
    redirect_to user_board_path(current_user, @board)
  end

  def edit
    #only allowed by the user to whom the board belongs
  end

  def update
  end

  def show
    @board = Board.find_by(id: params[:id])
    @user = @board.user
  end

  def destroy
    #only allowed by the user to whom the board belongs
    @board = Board.find(params[:id]).destroy
      redirect_to user_path(@board.user)
  end

  private
    def board_params
      params.require(:board).permit(:name, :user_id)
    end

    def require_login
      redirect_to root_url unless logged_in?
    end

end
