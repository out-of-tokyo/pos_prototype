class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :category
      t.integer :barcode_id, :limit => 8

      t.timestamps
    end
  end
end
