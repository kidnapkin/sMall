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
#

module ProductsHelper
  def product_price(product)
    if product.sale
      content_tag(:ins, number_to_currency(product.sale_price)) + content_tag(:del, number_to_currency(product.price))
    else
      content_tag(:ins, number_to_currency(product.price))
    end
  end
end
