class ItemsController < ApplicationController
  def index
     @items = Item.all
     @item = Itme.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end


  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end


end
