class GuestSeminarSchema < ActiveRecord::Migration
  def change
  	create_table :guests_seminars, id: false do |t|
  	  t.integer :guest_id
  	  t.integer :seminar_id
    end
    create_table :hotels_venues, id: false do |t|
  	  t.integer :hotel_id
  	  t.integer :venue_id
    end
  end
end
