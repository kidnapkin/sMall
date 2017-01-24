class PagesController < ApplicationController
  def home
    @products = Product.order(created_at: :desc).limit(6)
  end

  def about;
  end
end
