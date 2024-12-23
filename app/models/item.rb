class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :categorygenre

  #空の投稿を保存できないようにする
  validates :title, :text, presence: true

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :categorygenre_id, numericality: { other_than: 1 , message: "can't be blank"}
  belongs_to :user
  has_one :shipping
  has_many :records
end
