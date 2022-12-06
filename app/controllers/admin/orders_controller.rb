class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @customer = Customer.find(params[:id])
  end

  def update

  end

  private
   def order_params
    params.require(:order).permit(:customer_id, :shipping_postal, :shipping_adress, :shipping_name, :postage, :payment_method, :billing_amount, :order_status)
   end
end
