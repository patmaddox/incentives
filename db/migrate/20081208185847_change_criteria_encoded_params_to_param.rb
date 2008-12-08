class ChangeCriteriaEncodedParamsToParam < ActiveRecord::Migration
  def self.up
    rename_column :incentive_criteria, :encoded_params, :param
  end

  def self.down
    rename_column :incentive_criteria, :param, :encoded_params
  end
end
