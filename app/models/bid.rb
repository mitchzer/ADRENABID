class Bid < ApplicationRecord
  belongs_to :auction
  belongs_to :user
  monetize :price_cents
  validates :price_cents, uniqueness: { scope: [:user, :auction],
    message: "You have already bid for this price" }
  validate :price_cents_is_multiple_of_price_step_cents

  def price_cents_is_multiple_of_price_step_cents
    if price_cents % auction.price_step_cents != 0
      errors.add(:price_cents, "must be a proper mutliple of price step")
    end
  end
end
