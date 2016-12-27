class Product < ApplicationRecord
  mount_uploader :image, ProductImageUploader
  has_many :line_items
  belongs_to :category
  before_destroy :ensure_not_referenced_by_any_line_item
  
  
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'line items exist')
      return false
    end
  end
end
