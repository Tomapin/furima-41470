class ItemsController < ApplicationController
  before_action :basic_auth
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def show
  end

  def edit
    if @item.user_id != current_user.id || @item.order!=nil
      redirect_to root_path
    else
      render 'edit',status: :unprocessable_entity
    end
  end

  def update
    @item.update(item_params)
    if @item.valid?
      redirect_to item_path(item_params)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    if user_signed_in? && @item.user == current_user
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end