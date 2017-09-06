class CreateArtLabels < ActiveRecord::Migration[5.1]
  def change
    create_table :art_labels do |t|
      t.string :name, null: false
      t.string :image_url, null: false
      t.string :brewery, null: false
      t.string :beer_style
      t.string :art_style
      t.string :container_type
      t.text :beer_description
      t.text :art_description
      t.integer :beer_rating
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
