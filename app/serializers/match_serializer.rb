class MatchSerializer < ActiveModel::Serializer
  attributes :id, :round_id, :group_id, :team1_id, :team2_id, :play_at, :ground_id, :city_id
end
