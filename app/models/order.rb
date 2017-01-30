# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :text
#  email      :string
#  pay_type   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  attr_accessor :card_number, :card_cvv, :card_expires_month, :card_expires_year, :token

  enum pay_type: {
    'Check' => 0,
    'Credit card' => 1,
    'Purchase order' => 2
  }

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: pay_types.keys
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }


  def self.month_options
    Date::MONTHNAMES.compact.each_with_index.map { |name, i| ["#{i+1} - #{name}", i+1]}
  end

  def self.year_options
    (Date.today.year..(Date.today.year+10)).to_a
  end

  def process_payment(cart)
    customer = Stripe::Customer.create email: email, card: token

    Stripe::Charge.create customer: customer.id,
                          amount: (cart.total_price * 100).to_i,
                          description: 'sMall order',
                          currency: 'usd'
  end
end
