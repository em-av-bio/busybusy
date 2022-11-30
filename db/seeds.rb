# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "nokogiri"
require "net/http"
require "open-uri"
JourneyMember.destroy_all
Journey.destroy_all
User.destroy_all
u1 = User.create!(nickname: "Gaëlle", email: "gaelle@toto.com", password: "azerty")
u2 = User.create!(nickname: "Anoula", email: "anoula@toto.com", password: "azerty")
u3 = User.create!(nickname: "Emmanuel", email: "emmanuel@toto.com", password: "azerty")
u4 = User.create!(nickname: "JeanRo", email: "jeanro@toto.com", password: "azerty")

def getRandImage(city)
  url = "https://www.bing.com/images/search?q=#{city}&qft=+filterui:imagesize-wallpaper+filterui:photo-photo&form=IRFLTR&first=1&tsc=ImageHoverTitle"
  html = URI.open(url)
  doc = Nokogiri::HTML(html)
  img = doc.css("img").select { |link| link["src"].nil? == false && link["src"].include?("https://") }.map { |link| link["src"] }.sample
  img.gsub!("w=", "")
  img.gsub!("h=", "")
  p img
end

city = gets.chomp

getRandImage(city)
