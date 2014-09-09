class ProductStore < ActiveRecord::Base
  belongs_to :stores
  belongs_to :products
  validates :price, presence: true
  validates :stock, presence: true
end
