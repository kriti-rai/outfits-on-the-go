class Board < ApplicationRecord
  belongs_to :user
  has_many :outfits, dependent: :destroy
  accepts_nested_attributes_for :outfits

end
