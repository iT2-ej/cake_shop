class Public::CartItemsController < ApplicationController

  def index
    @customer = current_customer
    @cart_items = @customer.cart_items
    @total_amount = 0
  end

  def edit
    @customer = current_customer
    @cart_item = @customer.cart_items
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else
      render :index
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @customer = current_customer
    @cart_items = @customer.items
    @cart_items.destroy
  end

  def create
    if nil != current_custmer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      @cart_item = current_custmer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      @cart_item.amount += params[:cart_item][:amount].to_i
      @cart_item.update(amount: @cart_item.amount)
      redirect_to cart_items_path
    else
       cart_item = CartItem.new(cart_item_params)
       cart_item.save
       redirect_to cart_items_path
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end

end
