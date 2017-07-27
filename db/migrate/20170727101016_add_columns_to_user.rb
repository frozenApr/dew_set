class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :star_photos_count, :integer, default: 0
    add_column :users, :like_photos_count, :integer, default: 0
    add_column :users, :star_posts_count, :integer, default: 0
    add_column :users, :followers_count, :integer, default: 0
    add_column :users, :following_count, :integer, default: 0
  end
end
