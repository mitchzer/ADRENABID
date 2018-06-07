class RemovePhotoFromProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :photo, :string
  end
end
