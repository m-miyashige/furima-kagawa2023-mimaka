require 'rails_helper'
require 'faker'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)

    def generate_sentence #@item.info用に1000文字以下の文字を作成
      sentence = Faker::Lorem.sentence
      while sentence.length > 1000
        sentence = Faker::Lorem.sentence
      end
      sentence
    end
  
    @item.info = generate_sentence #1000文字以下の文字を代入

  end


  describe '商品情報作成' do
    context '新規作成できる場合' do
      it '全ての項目が適切に入力されていれば新規作成できる' do
        expect(@item).to be_valid
      end
    end

    context '新規作成できない場合' do
      it '' do
        
      end
    end
  end

end


