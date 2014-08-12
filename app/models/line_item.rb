class LineItem < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  belongs_to :item, class_name: 'Product'
  belongs_to :order

  def total 
    self.quantity ? self.quantity * self.item.price_cents/100 : 0
  end 

  def pretty_total
    self.quantity ? number_to_currency(self.quantity * self.item.price_cents/100) : 0
  end 
  
end
