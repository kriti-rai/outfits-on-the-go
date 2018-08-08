class User < ApplicationRecord
  has_many :boards, dependent: :destroy
  has_many :outfits, through: :boards
  accepts_nested_attributes_for :boards

  has_secure_password
end
