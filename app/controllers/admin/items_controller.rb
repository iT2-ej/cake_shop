class Admin::ItemsController < ApplicationController

  def index
    @item = Item.new
    @items = Item.all
    render :index
  end

  def create
   item = Item.new(item_params)
   item.save
   redirect_to edit_admin_item_path(item.id)
  end

 def show
   @item = Item.find(params[:id])
 end

 def edit
   @item = Item.find(params[:id])
 end


 private
  def item_params
    params.require(:item).permit(:image)
  end
end
