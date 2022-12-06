class Public::OrdersController < ApplicationController

  def index
    @orders = Order.all
    @customer = current_customer
    @cart_items = @customer.cart_items
    @total_amount = 0
  end

  def new
    @order = Order.new
    @customer = current_customer
    @addresses = @customer.addresses
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to complete_path
  end

  def complete

  end

  def confirm
    @customer = current_customer
    @cart_items = @customer.cart_items
    @total_amount = 0
    @order = Order.new(order_params)
    if params[:order][:address_number] == "0"
      @order.shipping_postal = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_number] == "1"
       @address = Address.find(params[:order][:address_id])
       @order.shipping_postal = @address.postal_code
       @order.shipping_address = @address.address
       @order.shipping_name = @address.name
    elsif params[:order][:address_number] == "2"
      @address = Address.new()
      @address.postal_code = params[:order][:shipping_postal]
      @address.name =params[:order][:shipping_name]
      @address.address = params[:order][:shipping_address]
      @address.customer_id = current_customer.id
      @address.save
      @order.shipping_postal =@address.postal_code
      @order.shipping_name = @address.name
      @order.shipping_address = @address.address
    end

  end

  private
  def order_params
   params.require(:order).permit(:payment_method, :shipping_postal, :shipping_address, :shipping_name, :customer_id, :postage, :order_status, :billing_amount)
  end
end
