class AddBidPanelToBids < ActiveRecord::Migration[5.2]
  def change
    add_column :bids, :start_large_bid_price_cents, :integer
    add_column :bids, :end_large_bid_price_cents, :integer
  end
end
