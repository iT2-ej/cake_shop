class Public::OrdersController < ApplicationController

  def index
    @order = Order.new
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    order = Order.new(order_params)
    order.save
    redirect_to orders_path(order.id)
  end
end
