class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :brief_intro
      t.string :city
      t.integer :kind, default: 0
      t.decimal :price, default: 0.0, :precision => 8, :scale => 2
      t.decimal :ori_price, default: 0.0, :precision => 8, :scale => 2
      t.boolean :free_shipping, default: true
      t.integer :use_state, default: 10
      t.integer :user_id

      t.timestamps
    end
    add_index :products, :city
    add_index :products, :kind
    add_index :products, :price
    add_index :products, :use_state
  end
end
