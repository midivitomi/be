class Match < ActiveRecord::Base
  belongs_to :team1, class_name: 'Team', foreign_key: 'team1_id'
  belongs_to :team2, class_name: 'Team', foreign_key: 'team2_id'

  belongs_to :group
  belongs_to :round

  belongs_to :ground
  belongs_to :city
end
