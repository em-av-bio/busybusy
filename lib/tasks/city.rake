require "csv"
require "nokogiri"

namespace :city do
  # desc "toto"
  task import: :environment do
    Location.destroy_all
    # we need to require the file in db/data/villes_france.csv
    csv = File.read(Rails.root.join("db", "data", "villes2000.csv"))
    # we need to parse the csv file, it's a file with headers in french including accents
    csv = CSV.parse(csv, headers: true, encoding: "ISO8859-1")
    # we need to loop through the csv file
    csv.each do |row|
      # we need to create a new city with the attributes from the csv file
      location = Location.new
      location.city = row["ville_nom"]
      location.zip_code = row["ville_code_postal"]
      location.longitude = row["ville_longitude_deg"]
      location.latitude = row["ville_latitude_deg"]
      location.country = "France"
      location.image_url = location.get_rand_image
      location.save!
      puts location.city
    end
  end
end
