class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # ログインしていないユーザーをログインぺージに促す
  # index,showアクションは除外される
  before_action :set_item, only: [:edit, :show, :update]
  before_action :move_to_index, except: [:index, :show, :new, :create]


  def index
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:image, :name, :price, :shipping_charges_id, :category_id, :status_id, :explanation, :shipping_area_id, :days_to_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless @item.user.id == current_user.id
          # 投稿者専用ページ == 投稿者(ログインユーザー)
          # 投稿者(ログインユーザー)が投稿者専用ページではないページに遷移しようとした時は
      redirect_to action: :index
    end
  end
end
