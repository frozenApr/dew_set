class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :title
      t.string :brief_intro
      t.string :place
      t.string :key_word
      t.integer :kind, default: 0
      t.integer :user_id

      t.timestamps
    end
  end
end
