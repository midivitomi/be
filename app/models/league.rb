class League < ActiveRecord::Base
  has_many :competitions
  has_many :seasons, :through => :competitions

end
