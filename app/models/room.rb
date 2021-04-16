class Room < ApplicationRecord
  has_many :chats,dependent: :destroy
  has_many :user_rooms
  has_many :users,through: :user_rooms,dependent: :destroy
end
