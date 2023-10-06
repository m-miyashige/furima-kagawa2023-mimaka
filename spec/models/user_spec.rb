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
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが重複すると保存できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれていないと保存できない' do
        @user.email = 'testexample.com' # @が含まれていない
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では保存できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordは6文字より短いと保存できない' do
        @user.password = '12345' # 5文字
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角英数字混合していないと保存できない' do
        
      end
      it 'passwordとpassword（確認）が一致しないと保存できない' do
        @user.password_confirmation = 'password123' # 確認用パスワードが異なる
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameとfirst_nameがそれぞれ空では保存できない' do
        @user.last_name = ''
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "First name can't be blank")
      end
      it 'last_nameとfirst_nameがそれぞれ全角（漢字・ひらがな・カタカナ）でないと保存できない' do

      end
      it 'last_name_kana とfirst_name_kanaがそれぞれ空では保存できない' do
        @user.last_name_kana = ''
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", "First name kana can't be blank")
      end
      it 'last_name_kana とfirst_name_kanaがそれぞれ全角（カタカナ）でないと保存できない' do

      end
      it 'birth_date が空では保存できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end  
  end
