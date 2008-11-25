class CreateIncentives < ActiveRecord::Migration
  def self.up
    create_table :incentives do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :incentives
  end
end
