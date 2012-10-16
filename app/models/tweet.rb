class Tweet < ActiveRecord::Base
  belongs_to :zombie
  validates_presence_of :status
  
  scope :latest, order("created_at desc").limit(10)
end
