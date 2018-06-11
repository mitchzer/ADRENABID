class Product < ApplicationRecord
  has_many :auctions
  monetize :recommended_retail_price_cents
  mount_uploader :photo, PhotoUploader


end
