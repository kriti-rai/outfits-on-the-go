class TagsController < ApplicationController

  def index
    # @hashtags = SimpleHashtag::Hashtag.all
    @hashtags = Tag.all
  end

  def show
    binding.pry
    # @hashtag = SimpleHashtag::Hashtag.find_by_name(params[:hashtag])
    # @hashtagged = @hashtag.hashtaggables if @hashtag
    tag = Tag.find_by(name: params[:hashtag])
    @outfits = tag.outfits
    # binding.pry
  end

end
