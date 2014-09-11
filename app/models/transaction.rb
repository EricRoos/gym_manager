class Transaction < ActiveRecord::Base
  belongs_to :member

  before_save :update_balance

  def update_balance
    self.balance = self.rate * self.workouts
  end
end
