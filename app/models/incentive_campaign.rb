class IncentiveCampaign < ActiveRecord::Base
  belongs_to :incentive
  belongs_to :action, :class_name => "MessageAction"

  def name
    "#{incentive.name} : #{action.name}"
  end
end
