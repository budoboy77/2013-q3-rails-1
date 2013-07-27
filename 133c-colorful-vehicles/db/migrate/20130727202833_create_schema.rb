class CreateSchema < ActiveRecord::Migration
  def up
  	create_table :colors do |t|
  		t.string :name
  		t.string :color_code
  	end
  	create_table :vehicles do |t|
  		t.string :name
  		t.string :file
  	end
  end

  def down
  	drop_table :colors
  	drop_table :vehicles
  end
end
