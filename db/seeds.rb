# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


@product_titles = ["Brads Paws", "Dino Nylabone", "Bacon Filled Bone", "Greenies", "Healthy Hound", "Knotted Chew Rope", "Kong Cozie Marvin", "Rag Rope Ball", "Rileys Organic", "Zukes Training Treats"]
@quantity = [500,250,150,1000,600,475]
@price = [1025, 1599, 1999, 3075, 2599, 599, 1075]
@users = %w[Cyril Ona Ronald Evette Suzan Ariana Annie Yee Sirena Tatyana Marvin Aileen 
Myrta Jc Darnell Stasia Bobbye Willodean Dannielle Edythe Nathalie 
Takako Florida Loriann Lavinia Camille Tasha Lu Ashley Thresa Kyle Emily]
@descriptions = ['A scrumptious canine treat, helps fight plaque', 'Non-GMO wet food for a balanced doggie diet', 'Great toy for all pups', 'Your dog will love this!']
@tags = %w[Dry]

100.times do 
  User.create(name: @users.sample )
end 

100.times do 
  title = @product_titles.sample
  Product.create(title: title, quantity: @quantity.sample, price_cents: @price.sample, seller_id: (1..25).to_a.sample, 
    description: '@description.sample',  product_image: File.open(File.join(Rails.root, "vendor/assets/images/items/#{title.downcase.gsub(" ", "_")}.jpg")))
end 







Order.create(buyer_id: 1, closed: true)
Order.create(buyer_id: 2)
Order.create(buyer_id: 3)
Order.create(buyer_id: 4, closed: true)

LineItem.create(item_id: 1, order_id: 1, quantity: 3)
LineItem.create(item_id: 2, order_id: 2, quantity: 1)
LineItem.create(item_id: 3, order_id: 3, quantity: 2)
LineItem.create(item_id: 4, order_id: 4, quantity: 5)
LineItem.create(item_id: 5, order_id: 4, quantity: 2)

Tag.create(name: 'Dry Food')
Tag.create(name: 'Wet Food')
Tag.create(name: 'Treats')
Tag.create(name: 'Toys')

100.times do |n|
  ProductTag.create(tag_id: (1..4).to_a.sample, product_id: n)
end 