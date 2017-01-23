class AddSalePriceToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :sale, :boolean, default: false
    add_column :products, :sale_price, :decimal, precision: 8, scale: 2
  end
end
