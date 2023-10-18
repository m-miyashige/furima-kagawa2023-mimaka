class ItemsController < ApplicationController
  before_action :move_to_signin, only: :new

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end
  def edit
    @item = Item.find(params[:id])
    if @item.user != current_user
      redirect_to root_path, alert: '他のユーザーのプロトタイプは編集できません。'
    end
    

  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)

      redirect_to @item, notice: '商品情報を更新しました。'
    else

      render :edit,status: :unprocessable_entity
    end
      
  end
  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id,
                                 :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

  def move_to_signin
    return if user_signed_in?

    flash[:notice] = 'You need to sign in or sign up before continuing.'
    redirect_to user_session_path
  end
end
