class Outfit < ApplicationRecord
  mount_uploader :image, OutfitImageUploader

  belongs_to :board
  belongs_to :user

  validates_presence_of :image
end
