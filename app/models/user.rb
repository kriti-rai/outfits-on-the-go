class User < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :boards, dependent: :destroy
  has_many :outfits, through: :boards
  accepts_nested_attributes_for :boards

  has_secure_password

  def self.find_or_create_by(auth_hash)
    self.where(email_address: auth_hash["info"]["email"]).first_or_create do |user|
      user.username = auth_hash['info']['name']
      user.password = SecureRandom.hex
      user.image = auth_hash['info']['image']
    end
  end

end
