# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

City.create(city: 'London',
			country: 'United Kingdom',
			flag: "gb.png",
			timezone: 0,
			population: 8.3
			)

City.create(city: 'New York City',
			country: 'United States of America',
			flag: "us.png",
			timezone: -5,
			population: 8.3
			)

City.create(city: 'Shanghai',
			country: 'China',
			flag: "cn.png",
			timezone: +8,
			population: 23.0
			)