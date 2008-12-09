class PercentageDiscount
  def initialize(percentage)
    @percentage = percentage
  end

  def apply(amount)
    amount * (100 - @percentage) / 100
  end
end
