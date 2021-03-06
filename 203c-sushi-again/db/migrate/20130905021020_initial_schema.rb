class InitialSchema < ActiveRecord::Migration
  def change
  	create_table :dishes do |t|
      t.string  :name
      t.decimal :price
    end
    create_table :orders do |t|
      t.integer :table_number
      t.decimal :total_price
      t.timestamps
    end
    create_table :line_items do |t|
      t.integer :dish_id
      t.integer :order_id
      t.integer :quantity
      t.decimal :line_price
    end
  end
end
