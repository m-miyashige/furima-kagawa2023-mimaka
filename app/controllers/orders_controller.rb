class OrdersController < ApplicationController
  before_action :item_set, :move_to_root

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      pay_item
      @order_shipping.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end

  end

  private

  def order_params
    params.require(:order_shipping).permit( :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],    # カード トークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def item_set
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    unless user_signed_in?    # ログインしていないとトップページへ戻る
      redirect_to root_path
    end
    if @item.user_id == current_user.id    #自身が出品した商品の場合トップページへ戻る
      redirect_to root_path
    end
    unless @item.order.nil?    #販売済みの商品の場合トップページへ戻る
      redirect_to root_path
    end
  end

end
