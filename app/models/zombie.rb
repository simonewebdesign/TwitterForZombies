class Zombie < ActiveRecord::Base
  has_many :tweets
  has_one :brain
end
