class Public::CartItemsController < ApplicationController

  def index
    @customer = current_customer
    @cart_items = @customer.cart_items
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(cart_item_params)
      redirect_to cart_items_path
    else
      render :index
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @customer = current_customer
    @items = @customer.items
    @item.destroy
  end

  def create

  end
end
