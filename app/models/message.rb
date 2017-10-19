class Message < ApplicationRecord
  belongs_to :from_user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :to_user, class_name: 'User', foreign_key: 'to_user_id'
  belongs_to :room
  after_create_commit { MessageBroadcastJob.perform_later(unread_count, self) }

  scope :unread, -> { where(read: false) }

  def unread_count
    Message.unread.where(to_user_id: to_user_id).count
  end
end
