class User < ApplicationRecord
  has_secure_password
  has_many :boards
  has_many :outfits, through: :boards
  accepts_nested_attributes_for :boards
end
