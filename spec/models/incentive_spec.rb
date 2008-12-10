require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Incentive do
  before(:each) do
    @valid_attributes = {
    }
  end

  it "should create a new instance given valid attributes" do
    Incentive.create!(@valid_attributes)
  end

  describe "add_criteria" do
    it "should create a new criterium for the incentive" do
      i = Incentive.new :model => Cart
      i.add_criteria :total_greater_than, 50
      i.should have(1).criteria
    end

    it "should convert activerecord objects into param form" do
      item = mock_model(Item, :id => 123)
      i = Incentive.new :model => Cart
      i.add_criteria :containing_item, item
      i.criteria.first.param.should == item.to_param
    end
  end

  it "should know the number of items matching it" do
    Cart.create! :total => 200
    Cart.create! :total => 150
    i = Incentive.new :model => Cart
    i.add_criteria :total_greater_than, 175
    i.save!

    i.matching_count.should == 1
  end
end
