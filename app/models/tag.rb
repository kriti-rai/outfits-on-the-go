class Tag < ApplicationRecord
  has_many :outfits_tags
  has_many :outfits, through: :outfits_tags
end
