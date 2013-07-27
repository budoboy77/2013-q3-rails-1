# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Color.create(
			name: 'purple',
			color_code: '#6666FF')

Color.create(
			name: 'yellow',
			color_code: '#FFFF66')

Color.create(
			name: 'green',
			color_code: '#66FF66')

Color.create(
			name: 'fuschia',
			color_code: '#CC00FF')

Vehicle.create(
				name: 'car',
				file: '/images/car.png')

Vehicle.create(
				name: 'bicycle',
				file: '/images/bike.png')

Vehicle.create(
				name: 'bus',
				file: '/images/bus.png')

Vehicle.create(
				name: 'plane',
				file: '/images/plane.png')