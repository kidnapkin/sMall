class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:new, :create]
  before_action :ensure_cart_isnt_empty, only: :new
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)
    @order.process_payment(@cart) if params[:order][:pay_type] == 'Credit card'

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        OrderMailer.received(@order).deliver_later
        format.html { redirect_to products_url, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    if params[:payment]
      params.require(:order).permit(:name, :address, :email, :pay_type).merge(params.require(:payment).permit(:token))
    else
      params.require(:order).permit(:name, :address, :email, :pay_type)
    end
  end

  def ensure_cart_isnt_empty
    if @cart.line_items.empty?
      redirect_to products_url, alert: 'Your cart is empty'
    end
  end
end
