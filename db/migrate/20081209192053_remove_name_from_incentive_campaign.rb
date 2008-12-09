class RemoveNameFromIncentiveCampaign < ActiveRecord::Migration
  def self.up
    remove_column :incentive_campaigns, :name
  end

  def self.down
    add_column :incentive_campaigns, :name, :string
  end
end
