class Makeup < ApplicationRecord
  belongs_to :user
  has_many :images, as: :imageable

  validates :title, :brief_intro, :price, presence: true
end
