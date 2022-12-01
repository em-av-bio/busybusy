# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# User.destroy_all
# Location.destroy_all
# JourneyLocation.destroy_all
# User.destroy_all
u7 = User.create!(nickname: "Mimederdeeffrsfeedeeo", email: "minfosidreefroeedee@tdeeoto.com", password: "azerty")
j1 = Journey.create!(name: "Entre postes")
journey_member = JourneyMember.create!(user_id: u7.id, journey_id: j1.id)

l1 = Location.create!(city: "Paris", country: "France")
acc = Accommodation.create!(name: "Hotel de la paix", details: "blabla")
acc2 = Accommodation.create!(name: "Hotel de la px", details: "blabla")
acc3 = Accommodation.create!(name: "Hotel de l'amour", details: "blabla")


jl1 = JourneyLocation.create!(location_id: l1.id, journey_id: j1.id)

acc2 = JourneyAccommodation.create!(accommodation_id: acc.id, journey_id: j1.id)
acc3 = JourneyAccommodation.create!(accommodation_id: acc.id, journey_id: j1.id)
acc4 = JourneyAccommodation.create!(accommodation_id: acc.id, journey_id: j1.id)

act1 = Activity.create!(name: "Visite du Louvre", details: "cool", duration_in_h: "2")
act1 = Activity.create!(name: "Visite d'une usine", details: "cool", duration_in_h: "2")

actj1 = JourneyActivity.create!(activity_id: act1.id, journey_id: j1.id)
actj2 = JourneyActivity.create!(activity_id: act1.id, journey_id: j1.id)
