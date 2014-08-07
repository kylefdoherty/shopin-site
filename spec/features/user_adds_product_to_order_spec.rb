require 'rails_helper'

feature 'user adds product to order' do 
  before(:each) do 
    visit product_path
  end 

  scenario 'select to buy 2 items' do 
    fill_in 'quantity', with: 2
    
  end


end 