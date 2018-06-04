class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :recommended_retail_price

      t.timestamps
    end
  end
end
