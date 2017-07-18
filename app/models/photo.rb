class Photo < ApplicationRecord
  belongs_to :user
  has_many :images, as: :imageable

  validates :title, :brief_intro, presence: true
  enum kind: %i[ancientry lolita cosplay]
end
