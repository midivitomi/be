class Group < ActiveRecord::Base
  has_many :matches
  has_many :teams

  belongs_to :competition

end
