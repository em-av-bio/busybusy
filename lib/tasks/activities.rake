namespace :activities do
  task scrap: :environment do
    ScrapActivitiesService.new.call
  end
end
