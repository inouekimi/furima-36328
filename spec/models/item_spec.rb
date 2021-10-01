require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it 'image, name, explanation, category_id, status_id, shipping_charges_id, shipping_area_id, days_to_id, price, userが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'explanationが空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが選択されていなければ出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idが選択されていなければ出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'shipping_charges_idが選択されていなければ出品できない' do
        @item.shipping_charges_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges can't be blank")
      end
      it 'shipping_area_idが選択されていなければ出品できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'days_to_idが選択されていなければ出品できない' do
        @item.days_to_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to can't be blank")
      end
      it 'priceが空であれば出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceは¥300~¥9,999,999の間以外は保存できない' do
        @item.price = 299, 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
        # Price please enter between ¥300 ~ ¥ 9,999,999
        # 上記をエラーメッセージで使いたければapp/models/item.rbのバリデーションに記述しないといけない
      end
      it 'priceは全角では保存できない' do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceは英数字混合では保存できないこと' do
        @item.price = '1one'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceは英字では保存できない' do
        @item.price = 'one'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
