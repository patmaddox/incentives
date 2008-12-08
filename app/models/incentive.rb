class Incentive < ActiveRecord::Base
  has_many :criteria, :class_name => "IncentiveCriterium" do
    def sum
      inject {|sum, c| sum += c}
    end
  end
  
  def add_criteria(model, finder, param)
    param = param.to_param if param.respond_to?(:to_param)
    criteria.build(:model => model.to_s, :finder => finder.to_s, :param => param)
  end

  def met_by?(object)
    criteria.sum.met_by? object
  end

  def matching_count
    criteria.sum.executable_finder.count
  end

  def model
    criteria.first.model
  end
end
