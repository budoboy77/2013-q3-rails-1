photo1 = Photo.create! name: "Flatirons at dawn"
photo2 = Photo.create! name: "Flatirons at sunset"
photo3 = Photo.create! name: "Sunset from my window"
photo4 = Photo.create! name: "Mysterious blur"
tag1 = Tag.create! name: "Flatirons"
tag2 = Tag.create! name: "dawn"
tag3 = Tag.create! name: "sunset"

photo1.tags << tag1
photo1.tags << tag2
photo2.tags << tag1
photo2.tags << tag3
photo3.tags << tag3