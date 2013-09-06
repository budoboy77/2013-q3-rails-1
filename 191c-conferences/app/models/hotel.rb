class Hotel < ActiveRecord::Base
	has_and_belongs_to_many :venues, join_table: "hotels_venues",
    class_name: "Venue", foreign_key: "hotel_id",
    association_foreign_key: "venue_id"

end
