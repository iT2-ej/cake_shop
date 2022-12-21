class Admin::ItemsController < ApplicationController

  def index
    @item = Item.new
    @items = Item.all
    render :index
  end

  def create
   item = Item.new(item_params)
   item.save
   redirect_to admin_item_path(item)
  end

 def show
   @item = Item.find(params[:id])
 end

 def edit
   @item = Item.find(params[:id])
 end

 def update
   @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path
    else
      render :new
    end
 end

 private
  def item_params
    params.require(:item).permit(:image, :genre_id, :name, :introduction, :price, :is_active)
  end
end
