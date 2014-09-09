class Store < ActiveRecord::Base
  has_many :product_stores
  has_many :products, through: :product_stores
  validates :name, presence: true, uniqueness: true
  validates :beacon_id, presence: true, uniqueness: true
end
