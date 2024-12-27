class ItemsController < ApplicationController
  before_action :basic_auth
  before_action :authenticate_user!, only: [:new, :create]


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

  private
  
  def index
  end

  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end
  
end
