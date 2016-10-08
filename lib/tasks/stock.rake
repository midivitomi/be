require 'nokogiri'
require 'open-uri'

desc "Get stock prices from http://news.sportbox.ru/Vidy_sporta/Futbol/Russia/2nd_division/stats/turnir_12963/calendar"
url = "http://news.sportbox.ru"

task :stock => :environment do
  page = Nokogiri::HTML(open("http://maps.vlasenko.net/list/russia/voronezhskaya/"))
  cityes = page.css('a')
  # puts "======================>"
  # puts cityes.to_a
  cityes_arr = []
  idx = 0
  cityes = cityes.to_a
  cityes.shift
  cityes.pop
  cityes.pop
  cityes.pop

  cityes.each do |item|
    text = item.text
    cityes_arr.push([
      :id => idx,
      :name => text.downcase
    ])
    idx = idx + 1
  end
  puts "=======================>"
  puts cityes_arr
  # calendarArr = []

  # calendar = page.css('table.calendar-cutting-js tbody tr')

  # calendar = calendar.to_a
  # calendar.shift
  # calendar.pop
  # calendar.each do |item|

  #   itemParse = item.css('td').to_a
  #   link_item = item.css('a').to_a
  #   link_href = link_item[0]['href']
  #   item_in = Nokogiri::HTML(open(url+"/Vidy_sporta/Futbol/Russia/2nd_division/stats/turnir_12963/calendar"))
  #   puts "=======================>"
  #   puts item_in

  #   date = itemParse[0].css('span').text
  #   # toure = itemParse[0].css(':not(span)').text
  #   toure = itemParse[0].text.split('Тур')
  #   commands = itemParse[1].text.split(' — ')
  #   score = itemParse[2].text

  #   calendarArr.push([
  #     :date => date,
  #     :toure => toure[1].to_i,
  #     :commands => commands,
  #     :score => score,
  #     # :sity => sity
  #   ])
  # end



  # date = Date.parse dateText
  # @stock['date'] = date.strftime('%d.%m')
  # @stock['al_price'] = page.css('table.lme tr:nth-child(3) td:nth-child(3)').text
  # @stock['al_diff'] = page.css('table.lme tr:nth-child(3) td:nth-child(4)').text
  # @stock['cu_price'] = page.css('table.lme tr:nth-child(5) td:nth-child(3)').text
  # @stock['cu_diff'] = page.css('table.lme tr:nth-child(5) td:nth-child(4)').text
  # @stock['pb_price'] = page.css('table.lme tr:nth-child(7) td:nth-child(3)').text
  # @stock['pb_diff'] = page.css('table.lme tr:nth-child(7) td:nth-child(4)').text
  # @stock['ni_price'] = page.css('table.lme tr:nth-child(9) td:nth-child(3)').text
  # @stock['ni_diff'] = page.css('table.lme tr:nth-child(9) td:nth-child(4)').text
  # @stock['sn_price'] = page.css('table.lme tr:nth-child(11) td:nth-child(3)').text
  # @stock['sn_diff'] = page.css('table.lme tr:nth-child(11) td:nth-child(4)').text
  # @stock['zn_price'] = page.css('table.lme tr:nth-child(13) td:nth-child(3)').text
  # @stock['zn_diff'] = page.css('table.lme tr:nth-child(13) td:nth-child(4)').text

  # unless StockPrice.last.date == @stock['date']
  #   StockPrice.create(
  #     date: @stock['date'],
  #     al_price: @stock['al_price'],
  #     al_diff: @stock['al_diff'],
  #     cu_price: @stock['cu_price'],
  #     cu_diff: @stock['cu_diff'],
  #     pb_price: @stock['pb_price'],
  #     pb_diff: @stock['pb_diff'],
  #     ni_price: @stock['ni_price'],
  #     ni_diff: @stock['ni_diff'],
  #     sn_price: @stock['sn_price'],
  #     sn_diff: @stock['sn_diff'],
  #     zn_price: @stock['zn_price'],
  #     zn_diff: @stock['zn_diff']
  #   )
  # end

  # p StockPrice.last
end