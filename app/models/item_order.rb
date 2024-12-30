class ItemOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :token


  validates :postcode, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: 'is invalid.' }
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :block
    validates :token
  end

  def save
    order = Order.create(user_id:, item_id:)
    Payment.create(order_id: order.id, postcode:, prefecture_id:, city:, block:, building:,
                   phone_number:)
  end
end