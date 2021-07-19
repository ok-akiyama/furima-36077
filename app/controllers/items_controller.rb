class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :baria_user, only: [:edit, :destroy, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])  
    if @item.update(item_params) 
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :category_id, :price, :status_id, :delivery_id, :description, :area_id,
                                 :ship_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def baria_user
    redirect_to root_path unless Item.find(params[:id]).user.id.to_i == current_user.id
  end
end
