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

class RelatedProduct < Product
end
