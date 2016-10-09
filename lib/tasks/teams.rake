require 'nokogiri'
require 'open-uri'

desc "Ger teams"

task :teams => :environment do
  teams = Nokogiri::HTML(open("http://www.championat.com/football/_russia1d/1788/teams.html"))

  @stock = {}
  teamsArr = teams.css('.sport__table a').to_a

  teamsArr.each do |item|
    title = item.css('strong').text
    puts "===============>"
    puts title
  end

end