class CreateProductProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :product_properties do |t|
      t.string :value
      t.belongs_to :property, foreign_key: true
      t.belongs_to :product, foreign_key: true

      t.timestamps
    end
  end
end
