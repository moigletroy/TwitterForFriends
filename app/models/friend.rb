class Friend < ActiveRecord::Base
  attr_accessible :name
  has_many :tweets
end
