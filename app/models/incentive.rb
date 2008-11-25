class Incentive < ActiveRecord::Base
  has_many :criteria, :class_name => "IncentiveCriterium"
  
  def add_criteria(model, finder, *params)
    criteria.build(:model => model.to_s, :finder => finder.to_s, :params => params)
  end

  def met_by?(object)
    criteria.first.met_by? object
  end
end
