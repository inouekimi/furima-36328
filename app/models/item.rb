class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charges
  belongs_to :shipping_area
  belongs_to :days_to

  validates :name, :explanation, :image, presence: true
  validates  :price,  presence: true, numericality: { only_integer: true,
    greater_than: 300, less_than: 9_999_999 },format: { with: /\A[0-9]+\z/
      # priceがないと保存できない。300~9999999の数字のみ保存可能。半角でしか保存できない。
  }
  
  

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  # category_idのid:1以外のときに保存できる
  #  message: "can't be blank" = エラーmessage
  validates :shipping_charges_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_to_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :user
  has_one_attached :image
end