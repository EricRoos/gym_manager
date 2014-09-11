class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :member, index: true
      t.float :balance, :default => 0.0
      t.integer :workouts, :default => 0
      t.integer :workouts_used, :default => 0

      t.timestamps
    end
  end
end
