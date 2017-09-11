class DeleteColumnImageUrl < ActiveRecord::Migration[5.1]
  def change
    remove_column :art_labels, :image_url
  end
end
