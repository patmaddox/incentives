class CreateIncentiveCriteria < ActiveRecord::Migration
  def self.up
    create_table :incentive_criteria do |t|
      t.string :model
      t.string :finder
      t.string :encoded_params
      t.integer :incentive_id
      t.timestamps
    end
  end

  def self.down
    drop_table :incentive_criteria
  end
end
