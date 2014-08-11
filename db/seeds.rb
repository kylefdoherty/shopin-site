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

Product.create(title: "Kibble'n'Bits", quantity: 8, price_cents: 1025, seller_id: 7, description: 'A scrumptious canine treat, helps fight plaque')
Product.create(title: "Chow Down", quantity: 4, price_cents: 1590, seller_id: 7, description: 'Non-GMO wet food for a balanced doggie diet')
Product.create(title: "Horse Bully Sticks", quantity: 5, price_cents: 1995, seller_id: 7, description: 'Forget those measly bull penises')
Product.create(title: "Himalayan Kong", quantity: 9, price_cents: 3075, seller_id: 6, description: 'Made of yak cheese. Stronger than vulcanized rubber')
Product.create(title: "Tugga War", quantity: 2, price_cents: 3999, seller_id: 6, description: 'Why yes, you WILL pay too much for this hemp rope knot')

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