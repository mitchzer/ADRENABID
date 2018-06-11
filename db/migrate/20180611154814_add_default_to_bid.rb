class AddDefaultToBid < ActiveRecord::Migration[5.2]
  def change
    change_column_default :bids, :won, false
  end
end
