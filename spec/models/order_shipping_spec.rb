require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
    sleep 0.5
  end

  describe '商品購入' do
    context '購入できる場合' do
      it '全ての項目が適切に入力されていれば購入できる' do
        expect(@order_shipping).to be_valid
      end
      it '建物情報がなくても購入できる' do
        @order_shipping.building = ''
        expect(@order_shipping).to be_valid
      end
    end

    context '購入できない場合' do
      it 'トークンが空だと購入できない' do
        @order_shipping.token = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号がないと購入できない' do
        @order_shipping.postal_code = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が「3桁ハイフン4桁」でないと購入できない' do
        @order_shipping.postal_code = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '郵便番号が半角数値でないと購入できない' do
        @order_shipping.postal_code = '１２３−４５６７'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '都道府県がないと購入できない' do
        @order_shipping.prefecture_id = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村がないと購入できない' do
        @order_shipping.city = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("City can't be blank")
      end
      it '番地がないと購入できない' do
        @order_shipping.addresses = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Addresses can't be blank")
      end
      it '電話番号がないと購入できいない' do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が10桁以上11桁以内でないと購入できない' do
        @order_shipping.phone_number = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number is too short")
      end
      it '電話番号が半角数値でないと購入できない' do
        @order_shipping.phone_number = '１２３４５６７８９０'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'userが紐付いていなければ購入できない' do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ購入できない' do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
