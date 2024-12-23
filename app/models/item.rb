class Item < ApplicationRecord

  belongs_to :item
  has_many :records
end
