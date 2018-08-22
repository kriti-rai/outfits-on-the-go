class TagsController < ApplicationController

  def index
    @hashtags = Tag.all
  end

  def show
    if tag = Tag.find_by(name: params[:hashtag])
      @outfits = tag.outfits
    end
  end

end
