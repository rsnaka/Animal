class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :recoverable, :rememberable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true
end
