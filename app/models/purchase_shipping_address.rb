class PurchaseShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :municipalities, :address, :building_name, :telephone, :token

  with_options presence: true do
    validates :municipalities, :address, :user_id, :item_id, :token
    validates :shipping_area_id, numericality: { other_than: 1 , message: "can't be blank"}
    # ジャンルの選択が「--」の時は保存できないようにする
    # shipping_area_idのid:1以外のときに保存できる
    # message: "can't be blank" = エラーmessage
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :telephone, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipalities: municipalities, address: address, telephone: telephone, purchase_id: purchase.id)
  end
end
