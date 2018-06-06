class Wallet < ApplicationRecord
  belongs_to :user
  monetize :balance_cents

  def charge(amount)
    new_balance = balance + amount
    update_attribute(:balance, new_balance)
  end
end
