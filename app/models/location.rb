class Location < ApplicationRecord
  validates :country, :city, presence: true
  after_validation :geocode, if: :will_save_change_to_address?

  def get_rand_image

    url = "https://www.bing.com/images/search?q=#{self.city}&qft=+filterui:imagesize-wallpaper+filterui:photo-photo&form=IRFLTR&first=1&tsc=ImageHoverTitle"
    html = URI.open(url)
    doc = Nokogiri::HTML(html)
    img = doc.css("img").select { |link| link["src"].nil? == false && link["src"].include?("https://") }.map { |link| link["src"] }.first
    img.gsub!("w=", "")
    img.gsub!("h=", "")
  end
end
