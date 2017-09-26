class CreateMakeups < ActiveRecord::Migration[5.1]
  def change
    create_table :makeups do |t|
      t.string :title
      t.string :brief_intro
      t.string :city
      t.integer :price
      t.integer :user_id

      t.timestamps
    end
    add_index :makeups, :city
    add_index :makeups, :price
  end
end
