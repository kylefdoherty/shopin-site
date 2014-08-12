class AddStatusToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :status, :string, default: 'Processing'
  end
end
