class Public::CartItemsController < ApplicationController

  def index
    @item = Item.new
    @items = Item.all
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
    @item = Book.find(params[:id])
    @item.destroy
  end
end
