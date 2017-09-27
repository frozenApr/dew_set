class Product < ApplicationRecord
  belongs_to :user
  has_many :images, as: :imageable
  has_many :comments, as: :commentable
  
  validates :title, :brief_intro, :city, :kind, :price, :free_shipping, :use_state, presence: true
  enum kind: %i[clothing headwear prop]
end
