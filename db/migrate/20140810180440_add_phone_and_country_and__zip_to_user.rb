class AddPhoneAndCountryAndZipToUser < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string, default: ''
    add_column :users, :country, :string, default: ''
    add_column :users, :zip, :string, default: ''
  end
end
