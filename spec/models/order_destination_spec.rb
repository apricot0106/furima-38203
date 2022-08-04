require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_destination = FactoryBot.build(:order_destination, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品の購入者情報登録' do
    context '情報登録できる場合' do
      it '全ての入力事項が存在すれば登録できる' do
        expect(@order_destination).to be_valid
      end
      it '郵便番号が半角数字かつ「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
        @order_destination.post_code = '123-4567'
        expect(@order_destination).to be_valid
      end
      it '都道府県が「---」以外であれば保存できる' do
        @order_destination.ship_from_id = 1
        expect(@order_destination).to be_valid
      end
      it '建物名が空でも保存できる' do
        @order_destination.building_name = ''
        expect(@order_destination).to be_valid
      end
      it '電話番号が半角数字で10桁以上11番桁以内かつハイフンなしであれば保存できる' do
        @order_destination.phone_number = '09012345678'
        expect(@order_destination).to be_valid
      end
    end

    context '情報登録できない場合' do
      it 'userが紐付いていないと登録できない' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと登録できない' do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと登録できない' do
        @order_destination.post_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンがないと登録できない' do
        @order_destination.post_code = '1234567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '郵便番号が指定した形式でないと登録できない' do
        @order_destination.post_code = '123-456'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '郵便番号が半角数字でないと登録できない' do
        @order_destination.post_code = '１２３-４５６７'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '都道府県が「---」だと登録できない' do
        @order_destination.ship_from_id = 0
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Ship from can't be blank")
      end
      it '市区町村が空だと登録できない' do
        @order_destination.city = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと登録できない' do
        @order_destination.address = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと登録できない' do
        @order_destination.phone_number = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると登録できない' do
        @order_destination.phone_number = '090-1234-5678'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上だと登録できない' do
        @order_destination.phone_number = '090123456789'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が10桁未満だと登録できない' do
        @order_destination.phone_number = '090123456'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が半角数字でないと登録できない' do
        @order_destination.phone_number = '０９０１２３４５６７８'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Phone number is invalid')
      end
      it 'トークンが空だと登録できない' do
        @order_destination.token = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end