# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user1 = User.create(name: "user1")
user2 = User.create(name: "user2")
user3 = User.create(name: "user3")

product1 = Product.create(title: "product1", price: 10.00, seller_id: 1)
product2 = Product.create(title: "product2", price: 15.00, seller_id: 2)
product3 = Product.create(title: "product3", price: 20.00, seller_id: 3)
product4 = Product.create(title: "product4", price: 30.00, seller_id: 1)
product5 = Product.create(title: "product5", price: 40.00, seller_id: 2)


cart1 = Order.create(buyer_id: 1, closed: true)
cart2 = Order.create(buyer_id: 2, closed: false)
cart3 = Order.create(buyer_id: 2, closed: false)
cart4 = Order.create(buyer_id: 3, closed: true)

thing1 = LineItem.create(item_id: 1, order_id: 1)
thing2 = LineItem.create(item_id: 2, order_id: 2)
thing3 = LineItem.create(item_id: 3, order_id: 3)
thing4 = LineItem.create(item_id: 4, order_id: 4)
thing5 = LineItem.create(item_id: 5, order_id: 4)