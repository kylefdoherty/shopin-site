class Product < ActiveRecord::Base
  has_many :line_items, foreign_key: :item_id
  belongs_to :seller, class_name: :user
  has_many :product_tags
  has_many :tags, through: :product_tags

  searchable do
    text :title, :description
    text :tags do
      tags.map(&:name)
    end
    string :price
  end

end
