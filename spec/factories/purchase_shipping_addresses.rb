FactoryBot.define do
  factory :purchase_shipping_address do
    postal_code { '123-4567' }
    shipping_area_id { 2 }
    municipalities { '伊予市' }
    address { '1-1' }
    telephone { '1234567890' }
    # PurchaseShippingAddressクラスはモデルではないためuser,itemのアソシエーションを自動生成する機能がない
    # Rspecに直接記述する
    # user
    # item
    token {"tok_abcdefghijk00000000000000000"}
  end
end
