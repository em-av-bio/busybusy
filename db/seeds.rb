# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# User.destroy_all
Location.destroy_all
JourneyLocation.destroy_all
User.destroy_all
u7 = User.create!(nickname: "Mino", email: "mino@toto.com", password: "azerty")
j1 = Journey.create!(name: "Entre postes")
journey_member = JourneyMember.create!(user_id: u7.id, journey_id: j1.id)

l1 = Location.create!(city: "Paris", country: "France")


jl1 = JourneyLocation.create!(location_id: l1.id, journey_id: j1.id)
