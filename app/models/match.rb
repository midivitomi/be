class Match < ActiveRecord::Base
  belongs_to :team1, class_name: 'Team', foreign_key: 'team1_id'
  belongs_to :team2, class_name: 'Team', foreign_key: 'team2_id'

  belongs_to :group, optional: true
  belongs_to :round

  belongs_to :ground, optional: true
  belongs_to :city, optional: true
end
