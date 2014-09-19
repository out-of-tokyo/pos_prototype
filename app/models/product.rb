class Product < ActiveRecord::Base
  has_many :product_stores, foreign_key: 'product_id'
  has_many :stores, through: :product_stores
  validates :name, presence: true, uniqueness: true

  enum category: %i(food drink newspaper)
end
