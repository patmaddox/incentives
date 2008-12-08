class IncentiveCriterium < ActiveRecord::Base
  def met_by?(object)
    executable_finder(model_class).find_by_id(object.id)
  end

  def executable_finder(scope=model_class)
    scope.send(finder, param)
  end

  def +(other_criteria)
    CompositeCriterium.new model_class, self, other_criteria
  end

  def model_class
    model.constantize
  end

  class CompositeCriterium
    def initialize(model, *criteria)
      @model = model
      @criteria = criteria
    end

    def model
      @model.to_s
    end

    def met_by?(object)
      executable_finder.find_by_id(object.id)
    end

    def executable_finder(scope=@model)
      @criteria.inject(scope) {|s, c| c.executable_finder(s) }
    end

    def +(other)
      CompositeCriterium.new @model, *[other, @criteria].flatten
    end
  end
end
