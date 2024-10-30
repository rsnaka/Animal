class Post < ApplicationRecord
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :image, presence: true
end
