class Order < ActiveRecord::Base
  
  belongs_to :buyer, class_name: :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    self.items.collect {|i| i.price}.reduce(:+)
  end

end