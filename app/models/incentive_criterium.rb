class IncentiveCriterium < ActiveRecord::Base
  def params=(params)
    self.encoded_params = Marshal.dump(params)
  end

  def params
    Marshal.load encoded_params
  end

  def met_by?(object)
    model.constantize.send(finder, *params).find_by_id(object.id)
  end
end
