require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
    sleep 0.1
  end

  describe '商品の出品登録' do
    context '出品登録できる場合' do
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'カテゴリーが「---」以外であれば登録できる' do
        @item.category_id = 1
        expect(@item).to be_valid
      end
      it '商品の状態が「---」以外であれば登録できる' do
        @item.condition_id = 1
        expect(@item).to be_valid
      end
      it '配送料の負担が「---」以外であれば登録できる' do
        @item.shipping_charge_id = 1
        expect(@item).to be_valid
      end
      it '発送元の地域が「---」以外であれば登録できる' do
        @item.ship_from_id = 1
        expect(@item).to be_valid
      end
      it '発送までの日数が「---」以外であれば登録できる' do
        @item.preparation_day_id = 1
        expect(@item).to be_valid
      end
      it '価格が半角数字でかつ300円〜9,999,999円であれば登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end

    context '出品登録できない場合' do
      it 'ユーザー登録している人でないと出品できない' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it '1枚画像がないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空欄だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空欄だと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーの情報が「---」だと登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態の情報が「---」だと登録できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担の情報が「---」だと登録できない' do
        @item.shipping_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it '発送元の地域の情報が「---」だと登録できない' do
        @item.ship_from_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship from can't be blank")
      end
      it '発送までの日数の情報が「---」だと登録できない' do
        @item.preparation_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation day can't be blank")
      end
      it '価格が空欄だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '価格が300円未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格が9,999,999円を超えると登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end