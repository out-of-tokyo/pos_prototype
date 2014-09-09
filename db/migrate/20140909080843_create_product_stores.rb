class CreateProductStores < ActiveRecord::Migration
  def change
    create_table :product_stores do |t|
      t.integer :price
      t.integer :stock
      t.integer :store_id
      t.integer :product_id

      t.timestamps
    end
  end
end
