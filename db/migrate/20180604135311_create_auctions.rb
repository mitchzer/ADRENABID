class CreateAuctions < ActiveRecord::Migration[5.2]
  def change
    create_table :auctions do |t|
      t.datetime :starting_time
      t.datetime :ending_time
      t.integer :fee_per_bid
      t.integer :price_step
      t.integer :status
      t.integer :min_number_bids
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
