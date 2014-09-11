class AddRateToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :rate, :float, :default => 0.0
  end
end
