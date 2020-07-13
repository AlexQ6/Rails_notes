class AddPictureToNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :picture, :string
  end
end
