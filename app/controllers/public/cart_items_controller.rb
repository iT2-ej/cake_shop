class Public::CartItemsController < ApplicationController

  def index
    @customer = current_customer
    @cart_items = @customer.cart_items
    @total_amount = @customer.cart_items.items.price
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
   cart_item = CartItem.new(cart_item_params)
   cart_item.save
   redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end

end
