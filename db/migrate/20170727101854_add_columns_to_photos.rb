class AddColumnsToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :likes_count, :integer, default: 0
    add_column :photos, :stars_count, :integer, default: 0
  end
end
