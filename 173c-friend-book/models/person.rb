class Person < ActiveRecord::Base
	validates :name, uniqueness: true
	has_many :from_person, class_name: "Following", foreign_key: "from_person_id"
	has_many :to_person, class_name: "Following", foreign_key: "to_person_id"
	has_secure_password

end