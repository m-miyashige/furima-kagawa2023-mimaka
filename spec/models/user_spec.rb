require 'rails_helper'

  RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end
  
    describe 'ユーザー新規登録' do
      it 'ニックネームが空では保存できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では保存できない' do
      end
      it 'emailが重複すると保存できない' do
      end
      it 'emailに@が含まれていないと保存できない' do
      end
      it 'passwordが空では保存できない' do
      end
      it 'passwordは6文字より短いと保存できない' do
      end
      it 'passwordは半角英数字混合していないと保存できない' do
      end
      it 'passwordとpassword（確認）が一致しないと保存できない' do
      end
      it 'last_nameとfirst_nameがそれぞれ空では保存できない' do
      end
      it 'last_nameとfirst_nameがそれぞれ全角（漢字・ひらがな・カタカナ）でないと保存できない' do
      end
      it 'last_name_kana とfirst_name_kanaがそれぞれ空では保存できない' do
      end
      it 'last_name_kana とfirst_name_kanaがそれぞれ全角（カタカナ）でないと保存できない' do
      end
      it 'birth_date が空では保存できない' do
      end
    end  
  end
