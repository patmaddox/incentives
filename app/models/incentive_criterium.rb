class IncentiveCriterium < ActiveRecord::Base
  def met_by?(object)
    executable_finder(model.constantize).find_by_id(object.id)
  end

  def executable_finder(scope)
    scope.send(finder, param)
  end

  def +(other_criteria)
    CompositeCriterium.new model.constantize, self, other_criteria
  end

  class CompositeCriterium
    def initialize(model, *criteria)
      @model = model
      @criteria = criteria
    end

    def met_by?(object)
      @criteria.inject(@model) {|scope, c| c.executable_finder(scope) }.find_by_id(object.id)
    end

    def +(other)
      CompositeCriterium.new @model, *[other, @criteria].flatten
    end
  end
end
