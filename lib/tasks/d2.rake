require 'nokogiri'
require 'open-uri'

level_url = 'http://www.championat.com/football/_russia1d'

namespace :d2 do
  desc 'Get stadiums from D2'
  task :stadiums => :environment do
    page = Nokogiri::HTML(open("#{level_url}/1788/stadiums.html"))
    table_rows = page.css(".sport__table__stadium tr")

    table_rows.each do |item|
      if page.at_css(".sport__table__stadium__td._city")
        city = item.css(".sport__table__stadium__td._city").text.squish.split(",")[0]
        title = item.css(".sport__table__stadium__td._title").text.squish

        unless city.nil?
          city_rec = City.find_or_create_by!(:title => city)
          Ground.find_or_create_by(:title => title, :city_id => city_rec.id)
        end
      end
    end
  end
end
