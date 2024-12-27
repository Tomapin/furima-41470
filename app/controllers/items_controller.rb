class ItemsController < ApplicationController
  before_action :basic_auth
  before_action :authenticate_user!, only: [:new, :create, :show]
  before_action :set_item, only: :show

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def show
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
end
