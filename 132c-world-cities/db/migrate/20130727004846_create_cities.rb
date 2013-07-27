class CreateCities < ActiveRecord::Migration
  def up
  	create_table :cities do |t|
  		t.string :city
  		t.string :country
  		t.time :timezone
  		t.float :population
  	end
  end

  def down
  	drop_table :cities
  end
end
