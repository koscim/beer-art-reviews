class ChangeIntoxicationToString < ActiveRecord::Migration[5.1]
  def up
    change_column(:reviews, :intoxication_level, :string)
  end

  def down
    change_column(:reviews, :intoxication_level, 'integer USING CAST(intoxication_level AS integer)')
  end
end
