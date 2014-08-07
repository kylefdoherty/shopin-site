# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(name: "user1", vendor: true)
User.create(name: "user2", vendor: true)
User.create(name: "user3", vendor: true)
User.create(name: "user4")
User.create(name: "user5")

Product.create(title: "product1", price: 10.00, seller_id: 1)
Product.create(title: "product2", price: 15.00, seller_id: 2)
Product.create(title: "product3", price: 20.00, seller_id: 3)
Product.create(title: "product4", price: 30.00, seller_id: 6)
Product.create(title: "product5", price: 40.00, seller_id: 6)


Order.create(buyer_id: 1, closed: true)
Order.create(buyer_id: 2)
Order.create(buyer_id: 2)
Order.create(buyer_id: 3, closed: true)

LineItem.create(item_id: 1, order_id: 1)
LineItem.create(item_id: 2, order_id: 2)
LineItem.create(item_id: 3, order_id: 3)
LineItem.create(item_id: 4, order_id: 4)
LineItem.create(item_id: 5, order_id: 4)

Tag.create(name: 'Dry Food')
Tag.create(name: 'Wet Food')
Tag.create(name: 'Treats')
Tag.create(name: 'Toys')

ProductTag.create(tag_id: 1, product_id:1)
ProductTag.create(tag_id: 2, product_id:2)
ProductTag.create(tag_id: 3, product_id:1)
ProductTag.create(tag_id: 3, product_id:3)
ProductTag.create(tag_id: 4, product_id:3)
ProductTag.create(tag_id: 4, product_id:4)
ProductTag.create(tag_id: 4, product_id:5)