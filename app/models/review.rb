# == Schema Information
#
# Table name: reviews
#
#  id           :integer          not null, primary key
#  review       :text
#  product_id   :integer
#  author_name  :string
#  author_email :string
#  published    :boolean          default(FALSE)
#  rating       :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Review < ApplicationRecord
  validates :review, :product_id, :author_name, :author_email, :rating, presence: true
  belongs_to :product

  scope :published, -> { where(published: true) }
end
