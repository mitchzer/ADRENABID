class Order < ApplicationRecord
  belongs_to :user
  monetize :amount_cents

  enum status: [:pending, :paid, :canceled]
end
