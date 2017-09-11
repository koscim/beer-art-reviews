class SetDefaultsForOptionalArtAttributes < ActiveRecord::Migration[5.1]
  def up
    change_column_default(:art_labels, :beer_style, "")
    change_column_default(:art_labels, :art_style, "")
    change_column_default(:art_labels, :container_type, "")
    change_column_default(:art_labels, :beer_description, "")
    change_column_default(:art_labels, :art_description, "")
    change_column_default(:art_labels, :beer_rating, "")
  end

  def down
    change_column_default(:art_labels, :beer_style, nil)
    change_column_default(:art_labels, :art_style, nil)
    change_column_default(:art_labels, :container_type, nil)
    change_column_default(:art_labels, :beer_description, nil)
    change_column_default(:art_labels, :art_description, nil)
    change_column_default(:art_labels, :beer_rating, nil)
  end
end
