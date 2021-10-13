class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  # ログインしていないユーザーをログインぺージに促す
  # index,showアクションは除外される
  before_action :set_item, only: [:index, :create]
  before_action :b, only: :index

  def index
    @purchase_shipping_address = PurchaseShippingAddress.new
  end

  def create
    @purchase_shipping_address = PurchaseShippingAddress.new(purchase_params)
    if @purchase_shipping_address.valid?
      pay_item
      @purchase_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
    # binding.pryでparamsの中身を見ると:idと言うキーは存在しないが、:item_idというキーは存在するので(params[:item_id])と記述する
  end

  def purchase_params
    params.require(:purchase_shipping_address).permit(:postal_code, :shipping_area_id, :municipalities, :address, :building_name, :telephone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    # 1,binding.pry
    # 2,params(全ての情報が入っている)
    # 3,purchase_params(requireとpermitで全ての情報から、制限をかけて必要な情報だけを取り出す)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def b
    if @item.user.id != current_user.id && @item.purchase != nil || @item.user.id == current_user.id && @item.purchase != nil
      redirect_to root_path
    end
  end
end

