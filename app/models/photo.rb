class Photo < ApplicationRecord
  belongs_to :user

  validates :title, :brief_intro, presence: true
  enum kind: %i(ancientry lolita cosplay)

end
