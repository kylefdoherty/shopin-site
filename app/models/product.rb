class Product < ActiveRecord::Base
  mount_uploader :product_image, ProductImageUploader
  has_many :line_items, foreign_key: :item_id
  belongs_to :seller, class_name: :user

  # validates_presence_of   :product_image
  # validates_integrity_of  :product_image
  # validates_processing_of :product_image
end
