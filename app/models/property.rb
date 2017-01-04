# == Schema Information
#
# Table name: properties
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Property < ApplicationRecord
  has_many :product_properties, dependent: :destroy
  has_many :products, through: :product_properties
end
