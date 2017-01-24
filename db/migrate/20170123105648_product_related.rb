class ProductRelated < ActiveRecord::Migration[5.0]
  def change
    create_table :product_related do |t|
      t.integer :product_id
      t.integer :related_id
    end
    add_index :product_related, :product_id
    add_index :product_related, :related_id
    add_index :product_related, [:product_id, :related_id], unique: true
  end
end
