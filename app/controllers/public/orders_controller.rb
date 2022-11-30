class Public::OrdersController < ApplicationController

  def index
    @order = Order.new
    @orders = Order.all
  end

  def new
    @order = Order.new
    @customer = current_customer
    @addresses = @customer.addresses
  end

  def create
    order = Order.new(order_params)
    order.save
    redirect_to orders_path(order.id)
  end

  def complete

  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][address_id])
    @order.shipping_postal = current_customer.postal_code
    @order.shipping_address = current_customer.address
    @order.shipping_name = current_customer.last_name + current_customer.first_name
    binding.pry
  end

  private
  def order_params
   params.require(:order).permit(:payment_method, :shipping_postal, :shipping_address, :shipping_name)
  end
end
