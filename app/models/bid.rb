class Bid < ApplicationRecord
  belongs_to :auction
  belongs_to :user
  validates :price_cents, uniqueness: { scope: [:user, :auction],
    message: "You have already bid for this price" }
  validates :price_cents, numericality: { only_integer: true, message: "Can not be empty" }
  validate :price_cents_is_multiple_of_price_step_cents
  monetize :price_cents

  def price_cents_is_multiple_of_price_step_cents
    if price_cents != nil && price_cents % auction.price_step_cents != 0
      errors.add(:price_cents, "Must be a proper mutliple of price step")
    end
  end
end
