class Auction < ApplicationRecord
  has_many :bids, :dependent => :destroy
  belongs_to :product
  monetize :fee_per_bid_cents
  monetize :price_step_cents
  mount_uploader :photo, PhotoUploader

  def price_array
    self.bids.all.map(&:price_cents)
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

    if ordered_prices.empty?
      unique_bids = freq.select {|price, frequency| frequency == 2}
      ordered_prices = unique_bids.sort_by{ |price, frequency| price }
      unless ordered_prices.empty?
        result = ordered_prices.first.first
      else
        result = 0
      end
    else
      result = ordered_prices.first.first
    end
  end

  def winning_bid
    self.bids.where(:price_cents => winning_price).order(:created_at).limit(1).first
  end

# winning_user returns user object
def winning_user
  @bid = winning_bid
  if @bid
    @bid.user
  end
end

def set_winning_bid
  self.bids.where(won: true).each do |bid|
    bid.update(won: false)
  end
  winning_bid.update(won: true)
end

def set_auction_status
  if DateTime.now < self.ending_time && DateTime.now > self.starting_time && self.status == 0
    self.status = 1
    save
  elsif DateTime.now >= self.ending_time && self.status == 1
    self.status = 2
    save
    UserMailer.auction_won(self.winning_user).deliver_now if self.winning_user
  end
end

end
