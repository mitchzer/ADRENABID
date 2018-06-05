class Auction < ApplicationRecord
  has_many :bids
  belongs_to :product

  def price_array
    self.bids.all.map(&:price)
  end

  def bid_frequencies
    prices = price_array
    freq = Hash.new(0)
    prices.each { |x| freq[x] += 1 }
    freq
  end

  def winning_price
    freq = bid_frequencies
    unique_bids = freq.select {|price, frequency| frequency == 1}
    ordered_prices = unique_bids.sort_by{ |price, frequency| price }
    winning_price = ordered_prices.first.first
  end

  def winning_bid
    self.bids.where(:price => winning_price).first
  end


# winning_user returns user object
  def winning_user
    id = winning_bid.user_id
    User.where(:id => id).first
  end

end
