class Order < ActiveRecord::Base
  belongs_to :buyer, class_name: :user
end
