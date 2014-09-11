class Member < ActiveRecord::Base
  belongs_to :gym
  has_many :transactions
end
