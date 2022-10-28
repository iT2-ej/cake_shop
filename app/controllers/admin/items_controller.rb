class Admin::ItemsController < ApplicationController

  def index
    @item = Item.new
    @items = Item.all
    render :index
  end

  def create
   item = Item.new(item_params)
   item.save
   redirect_to edit_item_path(item.id)
  end

 def show
   @item = Item.find(params[:id])
 end

 def edit
   @item = Item.find(params[:id])
 end
end
