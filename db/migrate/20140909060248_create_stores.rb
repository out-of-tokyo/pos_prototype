class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.decimal :latitude
      t.decimal :longitude
      t.string :beacon_id

      t.timestamps
    end
  end
end
