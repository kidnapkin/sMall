# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  price       :decimal(8, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#  category_id :string
#  sale        :boolean          default(FALSE)
#  sale_price  :decimal(8, 2)
#

class Product < ApplicationRecord
  validates :name, :description, :price, presence: true

  mount_uploader :image, ProductImageUploader
  has_many :line_items
  belongs_to :category
  before_destroy :ensure_not_referenced_by_any_line_item

  has_many :product_properties, dependent: :destroy
  has_many :properties, through: :product_properties
  has_many :reviews
  has_and_belongs_to_many :related_products, join_table: :product_related,
                                             association_foreign_key: :related_id

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      true
    else
      errors.add(:base, 'line items exist')
      false
    end
  end

  def self.search(search_query)
    where('name ILIKE ? OR description LIKE ?', "%#{search_query}%", "%#{search_query}%")
  end
end
