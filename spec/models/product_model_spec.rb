require 'rails_helper'

RSpec.describe Product, type: :model do
  
  it 'price not empty' do
    product =  Product.create(price: nil)
    expect(product).to_not be_valid
  end
  
  it 'description not empty' do
    product =  Product.create(description: '')
    expect(product).to_not be_valid
  end
  
  it 'payment type got to be choose' do
    order =  FactoryGirl.create(:order)
    expect(Order.pay_types[order.pay_type]).to be_within(0).of(2)
  end
  
end
