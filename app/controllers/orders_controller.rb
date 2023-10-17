class OrdersController < ApplicationController

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
  end

  def create
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :price, :shipping_fee_status.name)
  end

end
