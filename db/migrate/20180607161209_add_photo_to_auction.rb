class AddPhotoToAuction < ActiveRecord::Migration[5.2]
  def change
    add_column :auctions, :photo, :string
  end
end
