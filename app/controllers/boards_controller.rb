class BoardsController < ApplicationController
  before_action :require_login
  before_action :set_board, only: [:edit, :show, :destroy]

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
    @user = @board.user
  end

  def destroy
    #only allowed by the user to whom the board belongs
    if current_user = @board.user
      @board.destroy
      redirect_to user_path(@board.user)
    end
  end

  private
    def board_params
      params.require(:board).permit(:name, :user_id)
    end

    def set_board
      @board = Board.find_by_id(params[:id])
    end

    def require_login
      redirect_to root_url unless logged_in?
    end

end
