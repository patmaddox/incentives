Given /^I have a cart$/ do
  @cart = Cart.create!
end

When /^I add an item that costs \$(\d+) to my cart$/ do |item_cost|
  @cart.purchase item_cost.to_i
end

When /^I add '(.*)' to my cart$/ do |item_name|
  @cart.add_to_cart Item.find_by_name(item_name)
end

Then /^I should not qualify for '(.*)'$/ do |incentive_name|
  @cart.incentives.should_not include(Incentive.find_by_name(incentive_name))
end

Then /^I should qualify for '(.*)'$/ do |incentive_name|
  @cart.incentives.should include(Incentive.find_by_name(incentive_name))
end
