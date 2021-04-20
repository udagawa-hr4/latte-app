class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :images
  is_impressionable counter_cache: true
  validates :images,presence: true
  validates :title,presence: true,length: { in: 1..20}
  validates :text,presence: true,length: { in: 1..1000}
  validate :image_length
  def self.search(search)
    if search
      Tweet.joins(:user).where(['text LIKE(?)OR title  LIKE(?)OR name LIKE(?)', "%#{search}%","%#{search}%","%#{search}%"])
    else
      Tweet.all
    end
  end
  private
  def image_length
    if images.length > 4
      errors.add(:images, "は4枚以内にしてください")
    end
  end
end
