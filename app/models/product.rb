class Product < ApplicationRecord
  has_many :auctions
  monetize :recommended_retail_price_cents


end
