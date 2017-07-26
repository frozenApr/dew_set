class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :place
      t.string :time
      t.string :city
      t.integer :price
      t.integer :user_id
      t.text :content
      t.string :outcome
      t.integer :post_type, default: 0
      t.boolean :has_clothing, default: false
      t.boolean :has_modelling, default: false

      t.timestamps
    end
    add_index :posts, :post_type
    add_index :posts, :has_clothing
    add_index :posts, :has_modelling
    add_index :posts, :price
    add_index :posts, :city
  end
end
