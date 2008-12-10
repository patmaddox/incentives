Given /^an incentive named '(.*)'$/ do |name|
  Incentive.create! :name => name, :model => Cart
end

Given /^'(.*)' is given for orders over \$(\d+)$/ do |name, amount|
  i = Incentive.find_by_name name
  i.add_criteria :total_greater_than, amount
  i.save!
end

Given /^'(.*)' is given for orders containing '(.*)'$/ do |incentive_name, item_name|
  i = Incentive.find_by_name incentive_name
  i.add_criteria :containing_item, Item.find_by_name(item_name)
  i.save!
end
