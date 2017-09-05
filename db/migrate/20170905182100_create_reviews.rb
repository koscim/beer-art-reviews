class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :feels, null: false
      t.integer :intoxication_level
      t.integer :joy
      t.integer :fear
      t.integer :sadness
      t.integer :disgust
      t.integer :anger
      t.integer :cleverness
      t.integer :collectability
      t.integer :controversiality
      t.integer :buyability
      t.integer :user_id, null: false
      t.integer :art_label_id, null: false

      t.timestamps null: false
    end
  end
end
