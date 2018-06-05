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

user1 = User.create!(username:"Alex", email:"abellocati@hotmail.com", address:"Frankfurt", password: "password")
user2 = User.create!(username:"Tony", email:"tony@gmail.com", address:"Glasgow", password: "password")
user3 = User.create!(username:"Mitch", email:"mitch@gmail.com", address:"Paris", password: "password")
user4 = User.create!(username:"Abel", email:"abel@gmail.com", address:"Metz", password: "password")

user1.wallet.balance_cents = "10000"
user2.wallet.balance_cents = "2000"
user3.wallet.balance_cents = "100000"
user4.wallet.balance_cents = "50000"

product1 = Product.create!(name:"IPhone X", recommended_retail_price: "100000")
product2 = Product.create!(name:"Applewatch", recommended_retail_price: "20000")
product3 = Product.create!(name:"IPad", recommended_retail_price: "500000")

auction1 = Auction.create!(starting_time: DateTime.now - rand(1..4), ending_time: DateTime.now + rand(1..4), fee_per_bid: "100", price_step: "10", status: "0", min_number_bids: "20", product: product1 )
auction2 = Auction.create!(starting_time: DateTime.now - rand(1..4), ending_time: DateTime.now + rand(1..4), fee_per_bid: "200", price_step: "20", status: "1", min_number_bids: "10", product: product2 )
auction3 = Auction.create!(starting_time: DateTime.now - rand(1..4), ending_time: DateTime.now + rand(1..4), fee_per_bid: "500", price_step: "50", status: "2", min_number_bids: "10", product: product3 )

bid1 = Bid.create!(price: "100", won: 0, auction: auction1, user: user1)
bid2 = Bid.create!(price: "200", won: 0, auction: auction1, user: user1)
bid3 = Bid.create!(price: "100", won: 0, auction: auction1, user: user2)
bid4 = Bid.create!(price: "100", won: 0, auction: auction2, user: user3)
