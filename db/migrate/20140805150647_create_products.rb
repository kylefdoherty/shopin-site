class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, default: ''
      t.float :price, default: 0.00
      t.text :description, default: ''
      t.integer :seller_id

      t.timestamps
    end
  end
end
