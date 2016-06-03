# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed gravida eleifend erat aliquam pretium. Nulla non felis purus. Cras volutpat pulvinar lectus, efficitur vestibulum mauris cursus sed. Praesent et iaculis sapien, vitae ultricies eros. Ut quis nibh a sem commodo consectetur. Integer accumsan eros mattis augue imperdiet congue. Nam nec sapien condimentum, ullamcorper nulla eu, imperdiet augue. Donec pharetra quam et nulla porta ultricies. Maecenas ornare ex quis tortor sagittis, ut dapibus est vestibulum. Aenean molestie libero et nisl efficitur, in porttitor lacus ultrices. Ut sit amet urna a quam vehicula maximus. Ut id leo vel quam eleifend ullamcorper a eu quam. Aenean a facilisis justo, non fringilla nibh. Pellentesque mollis, lorem ac convallis laoreet, ante dui auctor massa, nec placerat magna velit in mi. Sed consequat, libero sed volutpat blandit, ligula turpis ullamcorper orci, sit amet tincidunt quam sapien a justo.

Aenean consequat eget arcu a elementum. Nunc quis erat pellentesque, fermentum enim quis, finibus libero. Aenean nec justo felis. Mauris posuere vehicula porttitor. Cras a lacinia est. Integer diam nisl, pharetra ac ipsum nec, ullamcorper auctor metus. Cras sit amet velit felis. Nullam eleifend blandit leo dapibus bibendum. Integer eleifend sapien ut quam pretium, eu interdum lectus faucibus."


mel = User.create!(first_name: "Mel", last_name: "r", email: "mel@r.com", password: 123456, photo: File.open(Rails.root.join("db/fixtures/images", "profile_14.jpg")))
koen = User.create!(first_name: "Koen", last_name: "k", email: "koen@k.com", password: 123456, photo: File.open(Rails.root.join("db/fixtures/images", "profile_7.jpg")))

puts "User created!"

3.times do
Recipe.create!(user: mel, name: "Aspergesoep", summary: "Smaakvolle aspergesoep met een rommig tintje", description: lorem, kitchen: "Nederlands", course: "Voorgerecht", prep_time: 15, photo: File.open(Rails.root.join("db/fixtures/images", "aspergesoep.jpg")))
Recipe.create!(user: mel, name: "Lasagna Pollo", summary: "Lasange met kip en paprika", description: lorem, kitchen: "Italiaans", course: "Hoofdgerecht", prep_time: 30, photo: File.open(Rails.root.join("db/fixtures/images", "lasagna.jpg")))
Recipe.create!(user: koen, name: "Chocolade mouse", summary: "Een mouse met chocolade stukjes", description: lorem, kitchen: "Frans", course: "Nagerecht", prep_time: 20, photo: File.open(Rails.root.join("db/fixtures/images", "mouse.jpg")))
end

puts "Recipes created!"

