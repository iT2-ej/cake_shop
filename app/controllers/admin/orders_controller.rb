class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @orders = Order.all
    @order_details = @order.order_details
    @order_customer = @order.customer
    @total_amount = 0
  end

  def update
   @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_order_path
    else
      render :new
    end
  end

  private
   def order_params
    params.require(:order).permit(:customer_id, :shipping_postal, :shipping_adress, :shipping_name, :postage, :payment_method, :billing_amount, :order_status)
   end
end
