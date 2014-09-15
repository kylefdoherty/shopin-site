require 'rails_helper'

describe User do
  bare_user = User.new

  it 'instantiates with nil values' do
    expect(bare_user.name).to be_nil
    expect(bare_user.email).to be_nil
  end
end

describe User, '.create_with_omniauth' do
  full_user = User.create_with_omniauth({provider: 'Facebook', uid: '2357', info: {name: 'Emily Lowing'}})

  it 'populates Facebook attributes' do
    expect(full_user.name).to_not be_nil
  end

  it 'does not update other fields' do
    expect(full_user.email).to be_nil
  end
end

describe User, '#vendor?' do
  user = User.create

  it 'returns true when vendor attribute is true' do
    user.vendor = true
    expect(user.vendor?).to eq true
  end

  it 'returns true when vendor attribute is false, if user owns a product' do
    user.vendor = false
    product = Product.create.tap { |p| p.seller_id = user.id }
    product.save
    expect(user.vendor?).to eq true
  end

  it 'returns false when both are false' do
    user.vendor = false
    expect(user.vendor?).to eq false
  end
end

describe User, '#format_phone' do
  it 'displays pretty phone number' do
    user = User.new.tap { |u| u.phone = '8456416152' }
    expect(user.format_phone).to eq('845-641-6152')
  end
end

describe User, '#closed_orders' do
  user = User.create

  it 'returns list of completed order history' do
    order1 = build_order id: 1, buyer_id: user.id, closed: true
    expect(user.closed_orders).to include order1
  end

  it 'does not include the current (open) order' do
    order2 = build_order id: 2, buyer_id: user.id, closed: false
    expect(user.closed_orders).to_not include order2
  end

  def build_order(options)
    Order.create(options)
  end
end

describe User, '#last_closed_order' do
  user = User.create

  it 'returns most recently completed order' do
    order1 = build_order buyer_id: user.id, closed: true
    order2 = build_order buyer_id: user.id, closed: true
    order3 = build_order buyer_id: user.id, closed: false

    expect(user.last_closed_order).to eq order2
  end

  def build_order(options)
    Order.create(options)
  end
end
