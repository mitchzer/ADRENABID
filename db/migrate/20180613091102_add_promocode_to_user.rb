class AddPromocodeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :promo_code, :string
  end
end
