class LineItem < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  belongs_to :item, class_name: 'Product'
  belongs_to :order

  def total 
    self.quantity ? self.quantity * self.item.price_cents/100.to_f : 0
  end 

  def pretty_total
    number_to_currency(self.total)
  end 
  
end
