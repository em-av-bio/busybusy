require "csv"
require "nokogiri"

namespace :city do
  # desc "toto"
  task import: :environment do
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
      location.country = "France"
      location.image_url = location.get_rand_image
      location.save!
      puts location.city
    end
  end

  # desc "titi"
  task scrap: :environment do
    location = "Lyon"
    url = "https://www.funbooker.com/fr/category/activites?search=Toutes+les+activit%C3%A9s&where=#{location}&page=1&nb_prices=&minAge=0&maxAge=0&tag="
    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)
    puts html_doc
  end
end
