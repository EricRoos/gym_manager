class Transaction < ActiveRecord::Base
  belongs_to :member
  before_save :update_balance

  def update_balance
    self.balance = self.rate * self.workouts
  end

  def use_workout!
    if has_workouts_left?
      self.workouts_used = self.workouts_used + 1
    end
    self.save
  end

  def has_workouts_left?
    workouts_used < workouts
  end
end
