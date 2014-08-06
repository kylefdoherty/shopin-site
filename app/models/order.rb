class Order < ActiveRecord::Base
  belongs_to :buyer, class_name: :user
  has_many :line_items
  has_many :items, class_name: 'Product', through: :line_items
end
