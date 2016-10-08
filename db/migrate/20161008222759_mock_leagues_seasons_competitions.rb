class MockLeaguesSeasonsCompetitions < ActiveRecord::Migration[5.0]
  def change
    league = League.create(:title => 'РФС')

    season_1 = Season.create(:title => '2016')
    season_2 = Season.create(:title => '2016/2017')
    
    Competition.create(:title => 'РФПЛ', :level => '1', :season_id => season_2.id, :league_id => league.id, :start_at => DateTime.new( 2016, 07, 31 ), :end_at => DateTime.new( 2017, 05, 21 ) )
    Competition.create(:title => 'ФНЛ', :level => '2', :season_id => season_2.id, :league_id => league.id, :start_at => DateTime.new( 2016, 07, 11 ), :end_at => DateTime.new( 2017, 05, 21 ) )
    Competition.create(:title => 'ПФЛ', :level => '3', :season_id => season_2.id, :league_id => league.id, :start_at => DateTime.new( 2016, 07, 20 ), :end_at => DateTime.new( 2017, 06, 04 ) )
    Competition.create(:title => 'III дивизион. Черноземье', :level => '4', :season_id => season_1.id, :league_id => league.id, :start_at => DateTime.new( 2016, 05, 07 ), :end_at => DateTime.new( 2016, 10, 29 ) )
    Competition.create(:title => 'Чемпионат Воронежской области', :level => '5', :season_id => season_1.id, :league_id => league.id, :start_at => DateTime.new( 2016, 04, 30 ), :end_at => DateTime.new( 2016, 10, 29 ) )
    Competition.create(:title => 'ВЛДФ', :season_id => season_1.id, :league_id => league.id, :start_at => DateTime.new( 2016, 04, 23 ), :end_at => DateTime.new( 2016, 10, 30 ) )

  end
end
