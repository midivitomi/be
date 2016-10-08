class Leagues < ActiveRecord::Base
  has_many :competitions
  has_many :seasons, :through => :competitions

  # belongs_to :country

end
