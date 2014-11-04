class Gym < ActiveRecord::Base
  include EventTracker
  has_many :members
end
