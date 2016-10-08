class Group < ActiveRecord::Base
  belongs_to :city

  has_many :matches

end
