class BoardsController < ApplicationController
  before_action :require_login
  before_action :set_board, only: [:edit, :update, :show, :destroy]

  def new
    @board = Board.new
    @board.user = current_user
  end

  def create
    if !!params[:board][:name].nil? || params[:board][:name] == ""
      board = Board.new(name: "Untitled", user_id: current_user.id)
    else
      board = Board.new(board_params)
    end
    if board.save
      @board = board
      redirect_to @board
    end
  end

  def edit
    if current_user == @board.user
      render 'edit'
    else
      flash[:error] = "You don't have the permissions to perform this action."
      redirect_to @board
    end
  end

  def update
    if @board.update(board_params)
      flash[:success] = "Successfully updated the board"
      redirect_to @board
    else
      render 'edit'
    end
  end

  def feed
    @boards = Board.newest_to_oldest
  end

  def show
    @user = @board.user
    @outfit = Outfit.new
  end

  def index
    @user = User.find_by_id(params[:user_id])
    if !@user.nil?
      @boards = @user.boards
    else
      flash[:error] = "The user does not exist"
      redirect_to feed_path
    end
  end

  def destroy
    if current_user = @board.user
      @board.destroy
      redirect_to user_boards(current_user)
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
      if !logged_in?
        flash[:error] = "Please log in"
        redirect_to signin_path
      end
    end

end
