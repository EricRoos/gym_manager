class Transaction < ActiveRecord::Base
  belongs_to :member
  before_save :update_balance

  def update_balance
    self.balance = self.rate * self.workouts
  end

  def use_workout!
    if workouts_used < workouts
      self.workouts_used = self.workouts_used + 1
    end
    self.save
  end
end
