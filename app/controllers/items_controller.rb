class ItemsController < ApplicationController
  def index
     @items = Item.all
     @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @item = Item.new
  end


  def item_params
    params.require(:item).permit(:image,:name, :category_id, :price, :user, :status_id, :delivery_id, :description, :area_id, :ship_id).merge(user_id: current_user.id)
  end


end
