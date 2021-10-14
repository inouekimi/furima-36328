class ShippingAddress < ApplicationRecord
  belongs_to :purchase

  # validates :postal_cod, :municipalities, :address, :telephone, presence: true
  # validates :shipping_area_id, numericality: { other_than: 1 , message: "can't be blank"}
  # ジャンルの選択が「--」の時は保存できないようにする
  # shipping_area_idのid:1以外のときに保存できる
  # message: "can't be blank" = エラーmessage
end
