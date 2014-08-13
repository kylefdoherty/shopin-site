class Order < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  belongs_to :buyer, class_name: :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    self.line_items.empty? ? 0 : self.line_items.collect {|i| i.total}.reduce(:+)
  end  

  def pretty_total
    number_to_currency(self.total)
  end

end