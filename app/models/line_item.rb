class LineItem < ActiveRecord::Base
  belongs_to :item, class_name: 'Product'
  belongs_to :order
end
