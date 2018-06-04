class CreateWallets < ActiveRecord::Migration[5.2]
  def change
    create_table :wallets do |t|
      t.monetize :balance, currency: { present: false }
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
