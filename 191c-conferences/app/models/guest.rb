class Guest < ActiveRecord::Base
	has_belongs_to_many :seminars, join_table: "guests_seminars",
	class_name: "Seminar", foreign_key: "guest_id",
	association_foreign_key: "seminar_id"
end
