class LineItem < ActiveRecord::Base
  belongs_to :item, class_name: 'Product'
  belongs_to :order

  def total 
    self.quantity ? self.quantity * self.item.price : 0
  end 



end
