class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validate :message
  has_one_attached :image
end
