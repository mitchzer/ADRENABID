class AddCentsSuffixToColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :auctions, :fee_per_bid, :fee_per_bid_cents
    rename_column :auctions, :price_step, :price_step_cents
    rename_column :bids, :price, :price_cents
    rename_column :orders, :amount, :amount_cents
    rename_column :products, :recommended_retail_price, :recommended_retail_price_cents
  end
end
