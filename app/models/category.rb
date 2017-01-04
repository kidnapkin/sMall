# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  ancestry   :string
#

class Category < ApplicationRecord
  has_many :products
  has_ancestry

  def parent_enum
    Category.where.not(id: id).map { |c| [c.name, c.id] }
  end
end
