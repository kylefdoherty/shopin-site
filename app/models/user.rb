class User < ActiveRecord::Base
  has_many :orders, foreign_key: :buyer_id
  has_many :products, foreign_key: :seller_id
  has_many :line_items, through: :orders
  has_many :items, through: :line_items
end
