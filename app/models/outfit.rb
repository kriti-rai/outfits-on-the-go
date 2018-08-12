class Outfit < ApplicationRecord
  mount_uploader :image, OutfitImageUploader
  include SimpleHashtag::Hashtaggable
  hashtaggable_attribute :tags

  belongs_to :board
  belongs_to :user

  validates_presence_of :image

  def hashtag_array
    if self.tags
      tags.split("#")
    end
  end

end
