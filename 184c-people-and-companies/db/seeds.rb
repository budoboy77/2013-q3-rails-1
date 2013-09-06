# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

company1 = Company.create! name: "Microsoft"
company2 = Company.create! name: "IBM"
company3 = Company.create! name: "Sun"

Person.create! name: "John", company: company1
Person.create! name: "Jill", company: company2
Person.create! name: "Jack", company: company2
Person.create! name: "Ursula", company: nil