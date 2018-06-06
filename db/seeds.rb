# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)


Wallet.destroy_all
Bid.destroy_all
Auction.destroy_all
Product.destroy_all
User.destroy_all

user1 = User.create!(username:"Alex", email:"locatiabelal@gmail.com", address:"Frankfurt", password: "password")
user2 = User.create!(username:"Tony", email:"tony@gmail.com", address:"Glasgow", password: "password")
user3 = User.create!(username:"Mitch", email:"mitch@gmail.com", address:"Paris", password: "password")
user4 = User.create!(username:"Abel", email:"abel@gmail.com", address:"Metz", password: "password")

user1.wallet.update(balance_cents: 10000)
user2.wallet.update(balance_cents: 200)
user3.wallet.update(balance_cents: 100000)
user4.wallet.update(balance_cents: 50000)

product1 = Product.create!(name:"IPhone X", recommended_retail_price_cents:  100000)
product2 = Product.create!(name: "Applewatch", recommended_retail_price_cents: 20000)
product3 = Product.create!(name:"Rolex", recommended_retail_price_cents: 700000)

auction1 = Auction.create!(starting_time: DateTime.now - rand(1..4), ending_time: DateTime.now + rand(1..4), fee_per_bid_cents: 25, price_step_cents: 10, status: 0, min_number_bids: 20, product: product1 )
auction2 = Auction.create!(starting_time: DateTime.now - rand(1..4), ending_time: DateTime.now + rand(1..4), fee_per_bid_cents: 10, price_step_cents: 10, status: 1, min_number_bids: 10, product: product2 )
auction3 = Auction.create!(starting_time: DateTime.now - rand(1..4), ending_time: DateTime.now + rand(1..4), fee_per_bid_cents: 100, price_step_cents: 100, status: 2, min_number_bids: 10, product: product3 )

bid1 = Bid.create!(price_cents: 130, won: 0, auction: auction1, user: user1)
bid2 = Bid.create!(price_cents: 200, won: 0, auction: auction1, user: user1)
bid3 = Bid.create!(price_cents: 100, won: 0, auction: auction1, user: user2)
bid4 = Bid.create!(price_cents: 100, won: 0, auction: auction2, user: user3)
bid5 = Bid.create!(price_cents: 0, won: 0, auction: auction2, user: user2)
bid6 = Bid.create!(price_cents: 0, won: 0, auction: auction1, user: user3)
bid7 = Bid.create!(price_cents: 0, won: 0, auction: auction1, user: user3)
bid8 = Bid.create!(price_cents: 120, won: 0, auction: auction1, user: user2)
bid9 = Bid.create!(price_cents: 120, won: 0, auction: auction1, user: user1)
bid10 = Bid.create!(price_cents: 300, won: 0, auction: auction1, user: user2)
bid11 = Bid.create!(price_cents: 300, won: 0, auction: auction1, user: user3)
bid12 = Bid.create!(price_cents: 200, won: 0, auction: auction1, user: user2)
