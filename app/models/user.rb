class User < ActiveRecord::Base
  has_many :orders, foreign_key: :buyer_id
  has_many :products, foreign_key: :seller_id
  has_many :line_items, through: :orders
  # has_many :items, through: :line_items
  has_many :lines, source: :line_items, through: :products
  has_many :fulfillments, source: :order, through: :lines

  def self.create_with_omniauth(auth_hash)
    self.create(
      provider: auth_hash[:provider],
      uid: auth_hash[:uid],
      name: auth_hash[:info][:name]
    )
  end

  def vendor?
    self.vendor
  end 
  
end
