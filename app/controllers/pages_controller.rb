class PagesController < ApplicationController
  def home
    @products = Product.limit(6)
  end

  def about; end
end
