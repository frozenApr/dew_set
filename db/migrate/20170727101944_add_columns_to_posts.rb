class AddColumnsToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :stars_count, :integer, default: 0
  end
end
