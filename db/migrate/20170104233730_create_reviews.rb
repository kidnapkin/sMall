class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :review
      t.belongs_to :product, foreign_key: true
      t.string :author_name
      t.string :author_email
      t.boolean :published, default: false
      t.integer :rating

      t.timestamps
    end
  end
end
