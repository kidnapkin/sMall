# == Schema Information
#
# Table name: product_properties
#
#  id          :integer          not null, primary key
#  value       :string
#  property_id :integer
#  product_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ProductProperty < ApplicationRecord
  belongs_to :product
  belongs_to :property
end
