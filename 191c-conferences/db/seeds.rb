# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
guest1 = Guest.create! name: "Jill"
guest2 = Guest.create! name: "Jack"

seminar1 = Seminar.create! name: "Rocky Mountain Ruby 2013", start_date: "2013-09-25", venue_id: 1
seminar2 = Seminar.create! name: "Ignite Boulder 22", start_date: "2013-11-6", venue_id: 1

guest1.seminars << seminar1
guest2.seminars << seminar1
guest2.seminars << seminar2