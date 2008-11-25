class IncentiveCriterium < ActiveRecord::Base
  def params=(params)
    self.encoded_params = Marshal.dump(params)
  end

  def params
    Marshal.load encoded_params
  end
end
