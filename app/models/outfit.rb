class Outfit < ApplicationRecord
  mount_uploader :image, OutfitImageUploader
  # include SimpleHashtag::Hashtaggable
  # hashtaggable_attribute :tags

  belongs_to :board
  belongs_to :user
  has_many :outfits_tags
  has_many :tags, through: :outfits_tags

  validates_presence_of :image

  after_create do
    outfit = Outfit.find_by(id: self.id)
    hashtags = self.hashtags.scan(/#\w+/)
    hashtags.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      outfit.tags << tag
    end
  end

  before_update do
    outfit = Outfit.find_by(id: self.id)
    outfit.tags.clear
    hashtags = self.tags.scan(/#\w+/)
    hashtags.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      post.tags << tag
    end
  end

end
