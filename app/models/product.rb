class Product < ActiveRecord::Base
  has_many :line_items, foreign_key: :item_id
  belongs_to :seller, class_name: :user
end
