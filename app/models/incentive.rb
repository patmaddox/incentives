class Incentive < ActiveRecord::Base
  has_many :criteria, :class_name => "IncentiveCriterium"
  
  def add_criteria(model, finder, param)
    param = param.to_param if param.respond_to?(:to_param)
    criteria.build(:model => model.to_s, :finder => finder.to_s, :param => param)
  end

  def met_by?(object)
    criteria.inject {|sum, c| sum += c}.met_by?(object)
  end
end
