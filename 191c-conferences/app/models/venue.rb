class Venue < ActiveRecord::Base
	has_and_belongs_to_many :hotels, join_table: "hotels_venues",
    class_name: "Hotel", foreign_key: "venue_id",
    association_foreign_key: "hotel_id"
end
