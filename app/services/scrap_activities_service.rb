require "nokogiri"
require "open-uri"
require "awesome_print"

class ScrapActivitiesService

  def initialize
    @locations = Location.all
  end

  def call
    @locations.each do |location|
      @location = location
      scrap_city
    end

  end

  private

  def scrap_city
    url = "https://www.funbooker.com/fr/category/activites?search=Toutes+les+activit%C3%A9s&lat=#{@location.latitude}&lng=#{@location.longitude}page=1"
    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)

    links = html_doc.search(".listing-card__image a").first(30)
    hrefs = links.map { |link| link['href']}

    hrefs.each do |href|
      scrap_activity_show(href)
    end
  end

  def scrap_activity_show(path)
    url = "https://www.funbooker.com" + path
    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)
    name = html_doc.search(".title h1").text.gsub("\n", "").strip
    details = html_doc.search(".position-relative .border-bottom .mb-sm-1").text.gsub("\n", "").strip
    duration_in_h = html_doc.search(".flex-sm-col li")[0].text.gsub("\n", "").strip
    image_url =  html_doc.search("[data-srcset]").first.values[1]
    return unless details.present?

    activity = Activity.create!(location: @location, name: , details:, duration_in_h:, image_url:)
    p "Activity #{activity.name} created"
  end
end
