class Order < ActiveRecord::Base
  
  belongs_to :buyer, class_name: :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    self.line_items.empty? ? 0 : self.line_items.collect {|i| i.total}.reduce(:+)
  end

end