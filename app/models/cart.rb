class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :items, :through => :cart_items
  
  named_scope(:total_greater_than, lambda {|total| {:conditions => ['total > ?', total]}})
  named_scope(:containing_item, lambda {|item| {:conditions => ['cart_items.item_id=?', item], :joins => :cart_items}})
  
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
