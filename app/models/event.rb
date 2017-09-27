class Event < ApplicationRecord
  belongs_to :user
  has_many :images, as: :imageable
  has_many :comments, as: :commentable

  validates :title, :photo_style, :content, :content_raw, :city, :model_price, :cameramen_price, :start_time,
            :end_time, :deadline, :model_num, :cameramen_num, presence: true
end
