# TODO: write this
Person.create!(name: "Sally", password: "S")
Person.create!(name: "Charlie", password: "C")
Person.create!(name: "Linus", password: "L")
Person.create!(name: "Patty", password: "P")
Person.create!(name: "Snoopy", password: "S")

Following.create(from_person_id: "2", to_person_id: "3")
Following.create(from_person_id: "3", to_person_id: "5")
