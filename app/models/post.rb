class Post < ApplicationRecord
  belongs_to :user
  has_many :images, as: :imageable
  has_many :comments, as: :commentable
  enum post_type: %i[photographer model dresser]

  validates :title, :content, :place, :time, :price, :outcome, presence: true
end
