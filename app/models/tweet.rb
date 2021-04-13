class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :images
  is_impressionable counter_cache: true
  validates :images,presence: true
  def self.search(search)
    if search
      Tweet.joins(:user).where(['text LIKE(?)OR title  LIKE(?)OR name LIKE(?)', "%#{search}%","%#{search}%","%#{search}%"])
    else
      Tweet.all
    end
  end
end
