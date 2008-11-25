Given /^an item named '(.*)'$/ do |item_name|
  Item.create! :name => item_name
end
