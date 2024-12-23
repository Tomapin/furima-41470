class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :username, presence: true
  validates :barthday, presence: true

  has_many :items
  has_many :records
  has_many :shippings
end
