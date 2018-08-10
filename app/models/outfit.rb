class Outfit < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :board
  belongs_to :user
end
