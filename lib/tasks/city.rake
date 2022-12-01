require "csv"

namespace :city do
  desc "Import cities from csv"
  task import: :environment do
    # we need to require the file in db/data/villes_france.csv
    csv = File.read(Rails.root.join("db", "data", "villes_france.csv"))
    # we need to parse the csv file, it's a file with headers in french including accents
    csv = CSV.parse(csv, headers: true, encoding: "ISO8859-1")
    # we need to loop through the csv file
    csv.each do |row|
      # we need to create a new city with the attributes from the csv file
      location = Location.new
      location.city = row["ville_nom"]
      location.zip_code = row["ville_code_postal"]
      location.country = "France"
      location.save!
    end
  end
end
