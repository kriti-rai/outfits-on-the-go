class OutfitsController < ApplicationController
  before_action :set_outfit, only: [:edit, :update, :show, :delete]
  def new
    @outfit = Outfit.new
  end

  def create
    @outfit = Outfit.new(outfit_params)
    if @outfit.save
      render 'show'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @outfit.update(params[:outfit])
  end

  def show
  end

  def delete
    if current_user == @outfit.user
      @outfit.destroy
      redirect_to current_user
    end
  end

  private

  def outfit_params
    params.require(:outfit).permit(:caption, :user_id, :board_id)
  end

  def set_outfit
    Outfit.find_by(id: params[:id])
  end
end
