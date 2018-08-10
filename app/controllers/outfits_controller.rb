class OutfitsController < ApplicationController
  before_action :set_outfit, only: [:edit, :update, :show, :destroy]

  def new
    @outfit = Outfit.new(user: current_user, board: Board.find(params[:board_id]))
  end
  def create
    @outfit = Outfit.new(outfit_params)
    if @outfit.save
      redirect_to @outfit
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @outfit.update(outfit_params)
    redirect_to @outfit
  end

  def show
  end

  def destroy
    if current_user == @outfit.user
      @outfit.destroy
      redirect_to current_user
    end
  end

  private

  def outfit_params
    params.require(:outfit).permit(:caption, :user_id, :board_id, :image)
  end

  def set_outfit
    @outfit = Outfit.find_by(id: params[:id])
  end
end
