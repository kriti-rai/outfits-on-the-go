class Outfit < ApplicationRecord
  mount_uploader :image, OutfitImageUploader

  belongs_to :board
  belongs_to :user
end
