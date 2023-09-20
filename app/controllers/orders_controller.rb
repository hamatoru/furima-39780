class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :set_key, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    if current_user == @item.user || !@item.order.nil?
      redirect_to root_path
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:postcode, :prefecture_id, :city, :phone_number, :block, :building).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_key
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  end
  
end
