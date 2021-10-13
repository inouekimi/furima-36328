require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    # PurchaseShippingAddressクラスはモデルではないためuser,itemのアソシエーションを自動生成する機能がない
    # Rspecに直接記述する
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    sleep 0.3
    # 処理量が多すぎてエラーが出る
    # 処理量が多いので0.3秒待って処理を追いつかせる
    @a = FactoryBot.build(:purchase_shipping_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do

    context '商品購入できるとき' do
      it 'postal_code,shipping_area_id,municipalities,address,telephone,user,item,tokenが存在すれば購入できる' do
        expect(@a).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'postal_codeが空では購入できない' do
        @a.postal_code = ''
        @a.valid?
        expect(@a.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeがハイフンがないと購入できない' do
        @a.postal_code = '1234567'
        @a.valid?
        expect(@a.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_codeが3桁ハイフン4桁でないと購入できない' do
        @a.postal_code = '1234-567'
        @a.valid?
        expect(@a.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_codeが半角文字列でないと購入できない' do
        @a.postal_code = '１２３ー４５６７'
        @a.valid?
        expect(@a.errors.full_messages).to include("Postal code is invalid")
      end
      it 'shipping_area_idが選択されていなければ購入できない' do
        @a.shipping_area_id = ''
        @a.valid?
        expect(@a.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'municipalitiesが空では購入できない' do
        @a.municipalities = ''
        @a.valid?
        expect(@a.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空では購入できない' do
        @a.address = ''
        @a.valid?
        expect(@a.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephoneが空では購入できない' do
        @a.telephone = ''
        @a.valid?
        expect(@a.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephone全角数値では購入できない' do
        @a.telephone = '１２３４５６７８９０'
        @a.valid?
        expect(@a.errors.full_messages).to include("Telephone is invalid")
      end
      it 'telephoneハイフンがあると購入できない' do
        @a.telephone = '123-567-8901'
        @a.valid?
        expect(@a.errors.full_messages).to include("Telephone is invalid")
      end
      it 'telephoneは10桁以上でないと購入できない' do
        @a.telephone = '12345'
        @a.valid?
        expect(@a.errors.full_messages).to include("Telephone is invalid")
      end
      it 'telephoneは11桁以内でないと購入できない' do
        @a.telephone = '1234567890123'
        @a.valid?
        expect(@a.errors.full_messages).to include("Telephone is invalid")
      end
      it 'userが紐付いていなければ購入できない' do
        @a.user_id = nil
        @a.valid?
        expect(@a.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ購入できない' do
        @a.item_id = nil
        @a.valid?
        expect(@a.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では購入できない' do
        @a.token = ''
        @a.valid?
        expect(@a.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
