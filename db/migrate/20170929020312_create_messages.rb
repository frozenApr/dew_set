class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :content
      t.integer :user_id
      t.integer :to_user_id
      t.integer :room_id
      t.boolean :read, default: false

      t.timestamps
    end
    add_index :messages, :read
  end
end
