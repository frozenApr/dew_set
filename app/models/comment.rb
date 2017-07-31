class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :original, class_name: 'Comment', foreign_key: 'original_id'
  belongs_to :original_author, class_name: 'User', foreign_key: 'original_author_id'
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
end
