class ProductStore < ActiveRecord::Base
  belongs_to :store, class_name: 'Store'
  belongs_to :product, class_name: 'Product', foreign_key: 'product_id'
  validates :price, presence: true
  validates :stock, presence: true
end
