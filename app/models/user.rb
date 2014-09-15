class User < ActiveRecord::Base
  has_many :orders, foreign_key: :buyer_id
  has_many :products, foreign_key: :seller_id
  has_many :line_items, through: :orders
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
    self.vendor || !!Product.all.detect {|product| product.seller_id == self.id}
  end

  def format_phone
    self.phone.insert(3,'-').insert(7,'-')
  end

  def closed_orders
    self.orders.select {|order| order.closed == true}
  end

  def last_closed_order
    self.closed_orders.last
  end

end
