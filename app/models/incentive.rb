class Incentive < ActiveRecord::Base
  has_many :criteria, :class_name => "IncentiveCriterium" do
    def sum
      inject {|sum, c| sum += c}
    end
  end

  def model=(m)
    self[:model] = m.to_s
  end
  
  def add_criteria(finder, param)
    param = param.to_param if param.respond_to?(:to_param)
    criteria.build(:finder => finder.to_s, :param => param)
  end

  def met_by?(object)
    criteria.sum.met_by? object
  end

  def matching_count
    criteria.sum.executable_finder(model_class).count
  end

  def model_class
    model.constantize
  end
end
