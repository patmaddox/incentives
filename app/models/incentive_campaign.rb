class IncentiveCampaign < ActiveRecord::Base
  belongs_to :incentive
  delegate :met_by?, :matching_count, :model, :to => :incentive
  
  belongs_to :action, :class_name => "MessageAction"
  delegate :flash, :flash=, :apply, :to => :action

  def name
    "#{incentive.name} : #{action.name}"
  end
end
