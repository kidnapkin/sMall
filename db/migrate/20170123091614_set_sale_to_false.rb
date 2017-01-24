class SetSaleToFalse < ActiveRecord::Migration[5.0]
  def up
    Product.all.each do |product|
      product.sale = false
    end
  end
  
  def down
    Product.all.each do |product|
      product.sale = nil
    end
  end
end
