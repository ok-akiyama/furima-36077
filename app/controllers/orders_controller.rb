class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :sold_out_item, only: [:index, :create]
  before_action :current_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new(@item_params)
  end


  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal, :area_id, :municipality, :address, :building, :phone).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, 
      card: @order_address.token,   
      currency: 'jpy'                
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def sold_out_item
    redirect_to root_path if @item.order.present?
   end

   def current_item
    if @item.user_id == current_user.id
      redirect_to root_path
    end

end