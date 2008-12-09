class CreateIncentiveCampaigns < ActiveRecord::Migration
  def self.up
    create_table :incentive_campaigns do |t|
      t.string :name
      t.integer :incentive_id
      t.integer :action_id

      t.timestamps
    end
  end

  def self.down
    drop_table :incentive_campaigns
  end
end
