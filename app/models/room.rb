class Room < ApplicationRecord
  belongs_to :from_user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :to_user, class_name: 'User', foreign_key: 'to_user_id'
  has_many :messages
end
