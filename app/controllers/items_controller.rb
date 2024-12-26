class ItemsController < ApplicationController
  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
  
  def index
  end
  
  def message_params
    permitted_attributes = [:name, :image, :description, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :price]
    params.require(:item).permit(*permitted_attributes).merge(user_id: current_user.id)
  end
end
