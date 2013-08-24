class InitialSchema < ActiveRecord::Migration
  def up
    create_table :entrees do |t|
      t.string  :name
      t.decimal :price
    end
    create_table :tables do |t|
      t.integer	:number_of_chairs
    end
    create_table :orders do |t|
      t.integer  :table_id
      t.boolean  :has_paid
      t.decimal  :total_price
      t.datetime :created_at
      t.datetime :updated_at
    end
    create_table :line_items do |t|
      t.integer :entree_id
      t.integer :order_id
      t.integer :chair
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :quantity
      t.decimal :line_price
    end
  end

  def down
    drop_table :entrees
    drop_table :orders
    drop_table :line_items
    drop_table :tables
  end
end
