class Bid < ApplicationRecord
  belongs_to :auction
  belongs_to :user
  monetize :price_cents
  validates :price_cents, uniqueness: { scope: :user,
    message: "You have already bid for this price" }
end
