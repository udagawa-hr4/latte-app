class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_rooms,dependent: :destroy
  has_many :chats,dependent: :destroy
  has_many :rooms, through: :user_rooms,dependent: :destroy
  has_many :tweets,dependent: :destroy
  has_many :comments,dependent: :destroy
  validates :name,presence: true,length: { in: 1..20}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
