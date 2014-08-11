class LineItem < ActiveRecord::Base
  belongs_to :item, class_name: 'Product'
  belongs_to :order

  def total 
    self.quantity ? self.quantity * self.item.price_cents/100 : 0
  end 



end
