class Board < ApplicationRecord
  has_many :outfits
  belongs_to :user
end
