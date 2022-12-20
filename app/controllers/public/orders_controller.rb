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
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
    order_detail = OrderDetail.new
    order_detail.item_id = cart_item.item_id
    order_detail.order_id = @order.id
    order_detail.purchase_prise = cart_item.item.price
    order_detail.quantity = cart_item.amount
    order_detail.crafting_status = 0
    order_detail.save
    end
    @cart_items.destroy_all
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
    else 

    end

  end

  def show
   @orders = Order.all
   @order = Order.find(params[:id])
   @customer = current_customer
   @order_details = @order.order_details.all
   @total_amount = 0
  end

  private
  def order_params
   params.require(:order).permit(:payment_method, :shipping_postal, :shipping_address, :shipping_name, :customer_id, :postage, :order_status, :billing_amount)
  end
end
