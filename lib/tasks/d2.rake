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

        unless city.nil? || city.empty?
          city_rec = City.find_or_create_by(:title => city)
          Ground.create_with(:city_id => city_rec.id).find_or_create_by(:title => title)
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

      unless city.nil? || city.empty?
        city_rec = City.find_or_create_by(:title => city)
        Team.create_with(:city_id => city_rec.id).find_or_create_by(:title => title)
      end
    end
  end

  task :rounds => :environment do
    desc "Get rounds from D2"

    page = Nokogiri::HTML(open("#{LEVEL_URL}/#{SEASON_ID}/calendar.html"))
    table_rows = page.css(".sport__calendar__table tr")
    competition = page.css(".sport-head__title").text.squish
    competition_start_at = page.css(".sport-head__info__i._dates > text()").text.squish.split('—')[0]
    competition_end_at = page.css(".sport-head__info__i._dates > text()").text.squish.split('—')[1]
    season = "#{competition_start_at[6..10]}/#{competition_end_at[6..10]}"
    rounds = []

    table_rows.each do |item|
      round = item.css("td.sport__calendar__table__tour").text.squish

      unless round.nil? || round.empty?
        rounds |= [round]
      end
    end

    season_rec = Season.find_or_create_by(:title => season)
    competition_rec = Competition.find_by_title(competition)
    unless competition_rec
      competition_rec = Competition.create(
        :title => competition,
        :start_at => competition_start_at,
        :end_at => competition_end_at,
        :league_id => League.find_by_title('РФС').id,
        :season_id => season_rec.id
      )
    end

    rounds.each do |round|
      round_rec = Round.find_by(:title => round)
      unless round_rec
        Round.create(
          :title => round,
          :start_at => competition_start_at,
          :end_at => competition_end_at,
          :competition_id => competition_rec.id
        )
      end
    end
  end

  task :matches => :environment do
    desc "Get matches from D2"

    page = Nokogiri::HTML(open("#{LEVEL_URL}/#{SEASON_ID}/calendar.html"))
    table_rows = page.css(".sport__calendar__table tr")
    competition = page.css(".sport-head__title").text.squish

    table_rows.each do |item|
      round = item.css(".sport__calendar__table__tour").text.squish
      team_1 = item.css(".sport__calendar__table__teams").text.squish.split(' – ')[0]
      team_2 = item.css(".sport__calendar__table__teams").text.squish.split(' – ')[1]
      play_at = item.css(".sport__calendar__table__date").text.squish
      ground = item.css(".sport__calendar__table__stadium > a").text.squish
      city = item.css(".sport__calendar__table__stadium > text()").text.squish

      unless team_1.nil? || team_2.nil?
        Match.create(
          :round_id => Round.find_by(
            :title => round,
            :competition_id => Competition.find_by_title(competition).id
          ).id,
          :team1_id => Team.find_by_title(team_1).id,
          :team2_id => Team.find_by_title(team_2).id,
          :play_at => play_at,
          :ground_id => (Ground.find_by_title(ground) && Ground.find_by_title(ground).id),
          :city => (City.find_by_title(city) && City.find_by_title(city).id)
        )
      end
    end
  end
end
