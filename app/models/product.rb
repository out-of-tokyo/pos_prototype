class Product < ActiveRecord::Base
  has_many :product_stores
  validates :name, presence: true, uniqueness: true
  validates :barcode_id, presence: true, uniqueness: true
end
