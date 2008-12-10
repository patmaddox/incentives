class MoveModelToIncentive < ActiveRecord::Migration
  def self.up
    add_column :incentives, :model, :string
    remove_column :incentive_criteria, :model
  end

  def self.down
    add_column :incentive_criteria, :model, :string
    remove_column :incentives, :model
  end
end
