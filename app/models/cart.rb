class Cart < ActiveRecord::Base
  named_scope(:total_greater_than, lambda {|total| {:conditions => ['total > ?', total]}})
  
  def purchase(amount)
    update_attribute :total, total.to_i + amount
  end

  def incentives
    Incentive.find(:all).select {|i| i.met_by?(self) }
  end
end
