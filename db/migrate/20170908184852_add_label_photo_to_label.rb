class AddLabelPhotoToLabel < ActiveRecord::Migration[5.1]
  def change
    add_column :art_labels, :label_photo, :string
  end
end
