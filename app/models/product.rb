class Product < ActiveRecord::Base
  mount_uploader :product_image, ProductImageUploader
  has_many :line_items, foreign_key: :item_id
  belongs_to :seller, class_name: :user
  has_many :product_tags
  has_many :tags, through: :product_tags

  # validates_presence_of   :product_image
  # validates_integrity_of  :product_image
  # validates_processing_of :product_image

end
