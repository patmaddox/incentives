class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :items, :through => :cart_items
  
  named_scope(:total_greater_than, lambda {|total| {:conditions => ['total > ?', total]}})
  named_scope(:total_less_than, lambda {|total| {:conditions => ['total < ?', total]}})
  named_scope(:containing_item, lambda {|item| {:conditions => ['SELECT COUNT(*) FROM cart_items WHERE cart_items.cart_id=carts.id AND cart_items.item_id=?', item]}})

  attr_writer :discount
  
  def purchase(amount)
    update_attribute :total, total.to_i + amount
  end

  def add_to_cart(item)
    items << item
  end

  def incentives
    Incentive.find(:all).select {|i| i.met_by?(self) }
  end

  def incentive_campaigns
    IncentiveCampaign.find(:all).select {|i| i.met_by?(self) }
  end

  def subtotal
    self[:total].to_i
  end

  def total
    if @discount
      @discount.apply self[:total].to_i
    else
      self[:total].to_i
    end    
  end
end
