class Team < ActiveRecord::Base
  belongs_to :city

  has_many :home_matches, class_name: 'Match', foreign_key: 'team1_id'
  has_many :away_matches, class_name: 'Match', foreign_key: 'team2_id'
  has_many :competitions

  def matches
    Matches.where( 'team1_id = ? or team2_id = ?', id, id ).order( 'played_at' )
  end

  def upcoming_matches
    Matches.where( 'team1_id = ? or team2_id = ?', id, id ).where( 'play_at > ?', Time.now ).order( 'play_at' )
  end

  def past_matches
    Matches.where( 'team1_id = ? or team2_id = ?', id, id ).where( 'play_at < ?', Time.now ).order( 'play_at desc' )
  end

  def self.create_or_update_from_values( new_attributes, values )
    puts new_attributes.to_json

    rec = Team.find_by_key( new_attributes[ :key ] )
    if rec.present?
      puts "update Team #{rec.id}-#{rec.key}:"
    else
      puts "create Team:"
      rec = Team.new
    end

    rec.update_attributes!( new_attributes )
  end
end
