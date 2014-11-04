class Member < ActiveRecord::Base
  include EventTracker
  belongs_to :gym
  has_many :transactions
end
