class Post < ApplicationRecord
  belongs_to :user
  has_many :images, as: :imageable
  enum post_type: %i[photographer model dresser]

  validates :title, :content, :place, :time, :price, :outcome, presence: true
end
