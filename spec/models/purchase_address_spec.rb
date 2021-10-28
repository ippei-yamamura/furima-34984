require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe "商品購入機能" do
    context '商品購入できるとき' do
      it 'post_codeとdistination_idとcityとhouse_numberとphone_numberとtokenが存在すれば購入できる' do
        expect(@purchase_address).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'post_codeが空では購入できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeは-(ハイフン)なしでは購入できない' do
        @purchase_address.post_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeは全角の-(ハイフン)では購入できない' do
        @purchase_address.post_code = '123ー4567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it 'distination_idが未選択だと購入できない' do
        @purchase_address.distination_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Distination can't be blank")
      end

      it 'cityが空では購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空では購入できない' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空では購入できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが数値のみでないと購入できない' do
        @purchase_address.phone_number = 'aaaaaaaaaaa'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが9桁以下だと購入できない' do
        @purchase_address.phone_number = '000000000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが12桁以上だと購入できない' do
        @purchase_address.phone_number = '000000000000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end

      it "tokenが空では登録できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'ユーザーが紐づいていなければ購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it '商品が紐づいていなければ購入できない' do       
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

export PAYJP_SECRET_KEY='sk_test_1cde6be8f93ecb4bf4456d57'

export PAYJP_PUBLIC_KEY='pk_test_03c0ca03b0c098b0fdd4ae5c'