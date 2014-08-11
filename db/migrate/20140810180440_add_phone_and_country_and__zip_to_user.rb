class AddPhoneAndCountryAndZipToUser < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string
    add_column :users, :country, :string
    add_column :users, :zip, :string
  end
end
