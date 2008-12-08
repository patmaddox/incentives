class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :items, :through => :cart_items
  
  named_scope(:total_greater_than, lambda {|total| {:conditions => ['total > ?', total]}})
  named_scope(:total_less_than, lambda {|total| {:conditions => ['total < ?', total]}})
  named_scope(:containing_item, lambda {|item| {:conditions => ['SELECT COUNT(*) FROM cart_items WHERE cart_items.cart_id=carts.id AND cart_items.item_id=?', item]}})
  
  def purchase(amount)
    update_attribute :total, total.to_i + amount
  end

  def add_to_cart(item)
    items << item
  end

  def incentives
    Incentive.find(:all).select {|i| i.met_by?(self) }
  end
end
