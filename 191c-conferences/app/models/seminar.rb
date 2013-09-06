class Seminar < ActiveRecord::Base
	has_and_belongs_to_many :guests, join_table: "guests_seminars",
  	class_name: "Guest", foreign_key: "seminar_id",
  	association_foreign_key: "guest_id"
end
