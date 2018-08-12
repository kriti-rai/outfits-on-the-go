class Board < ApplicationRecord
  belongs_to :user
  has_many :outfits, dependent: :destroy
  accepts_nested_attributes_for :outfits
  scope :newest_to_oldest, -> {order("boards.updated_at DESC")}

  def created_date
    self.created_at.strftime("%b %e, %l:%M %p")
  end

end
