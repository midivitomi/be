require "nokogiri"
require "open-uri"

LEVEL_URL = "http://www.championat.com/football/_russia1d"
SEASON_ID = "1788"

namespace :d2 do
  task :grounds => :environment do
    desc "Get grounds from D2"

    page = Nokogiri::HTML(open("#{LEVEL_URL}/#{SEASON_ID}/stadiums.html"))
    table_rows = page.css(".sport__table__stadium tr")

    table_rows.each do |item|
      if page.at_css(".sport__table__stadium__td._city")
        city = item.css(".sport__table__stadium__td._city").text.squish.split(",")[0]
        title = item.css(".sport__table__stadium__td._title").text.squish

        unless city.nil?
          city_rec = City.find_or_create_by(:title => city)
          Ground.find_or_create_by(:title => title, :city_id => city_rec.id)
        end
      end
    end
  end

  task :teams => :environment do
    desc "Get teams from D2"

    page = Nokogiri::HTML(open("#{LEVEL_URL}/#{SEASON_ID}/teams.html"))
    table_data = page.css(".sport__table td")

    table_data.each do |item|
      city = item.css("span").text.squish
      title = item.css("strong").text.squish

      unless city.nil?
        city_rec = City.find_or_create_by(:title => city)
        Team.find_or_create_by(:title => title, :city_id => city_rec.id)
      end
    end
  end
end
