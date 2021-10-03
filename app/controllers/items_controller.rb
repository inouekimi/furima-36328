class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  # ログインしていないユーザーをログインぺージに促す
  # indexアクションは除外される

  def index
    # @items = Item.order("created_at DESC")
    @item = Item.all.order("created_at DESC")
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      # もし入力したデータがsaveできたら
      redirect_to root_path
      # 更新してトップページへ戻る
    else
      # saveできなかったら
      render :new
      # ビューのitem/newを表示する
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:image, :name, :price, :shipping_charges_id, :category_id, :status_id, :explanation, :shipping_area_id, :days_to_id).merge(user_id: current_user.id)
  end
end
