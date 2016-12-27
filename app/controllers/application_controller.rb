class ApplicationController < ActionController::Base
  include CurrentCart
  before_action :set_cart
  protect_from_forgery with: :exception
end
