class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :photo_style
      t.text :content
      t.text :content_raw
      t.string :city
      t.decimal :model_price, default: 0.0, :precision => 8, :scale => 2
      t.decimal :cameramen_price, default: 0.0, :precision => 8, :scale => 2
      t.datetime :start_time
      t.datetime :end_time
      t.integer :model_num
      t.integer :cameramen_num
      t.integer :user_id
      t.datetime :deadline

      t.timestamps
    end
    add_index :events, :city
  end
end
