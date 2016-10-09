class Competition < ActiveRecord::Base
  belongs_to :league
  belongs_to :season

  has_many :groups
  has_many :rounds
  has_many :matches, :through => :rounds
  has_many :teams
  has_many :grounds
end
