class Board < ApplicationRecord
  has_many :outfits, dependent: :destroy
  belongs_to :user
end
