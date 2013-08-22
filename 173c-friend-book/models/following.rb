class Following < ActiveRecord::Base
	belongs_to :people, class_name: "Person"
end