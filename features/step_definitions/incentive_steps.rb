Given /^an incentive named '(.*)'$/ do |name|
  Incentive.create! :name => name
end

Given /^'(.*)' is given for orders over \$(\d+)$/ do |name, amount|
  i = Incentive.find_by_name name
  i.add_criteria Cart, :total_greater_than, amount
  i.save!
end
