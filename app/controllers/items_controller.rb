class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :baria_user, only: [:edit, :destroy, :update]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
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
