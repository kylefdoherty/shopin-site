class Product < ActiveRecord::Base
  mount_uploader :product_image, ProductImageUploader
  has_many :line_items, foreign_key: :item_id
  belongs_to :seller, class_name: :user
  has_many :product_tags
  has_many :tags, through: :product_tags

  # validates_presence_of   :product_image
  # validates_integrity_of  :product_image
  # validates_processing_of :product_image



  def price_dollars
    price_cents.to_d/100 if price_cents
  end

  def price_dollars=(dollars)
    self.price_cents = dollars.to_d*100 if dollars.present?
  end  

end
