class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :nick_name
      t.string :phone_number
      t.integer :gender, default: 0
      t.string :place
      t.string :avatar
      t.string :remember_token
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :nick_name
    add_index :users, :phone_number
  end
end
