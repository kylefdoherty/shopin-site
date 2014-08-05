class LineItem < ActiveRecord::Base
  belongs_to :item, class_name: :product
  belongs_to :order
end
