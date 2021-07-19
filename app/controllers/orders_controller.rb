class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order = Order.new
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.create(order_params)
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
    params.require(:order_address).permit(:postal, :area_id, :municipality, :address, :building, :phone).merge(token: params[:token], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end