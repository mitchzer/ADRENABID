class AddStatusToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :status, :integer, null: false, default: 0
    add_column :orders, :payment, :jsonb
  end
end
