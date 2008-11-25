require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Cart do
  before(:each) do
    @valid_attributes = {
    }
  end

  it "should create a new instance given valid attributes" do
    Cart.create!(@valid_attributes)
  end

  describe "#purchase" do
    it "should increase the total by the amount purchased" do
      c = Cart.create!
      c.purchase 200
      c.reload.total.should == 200
    end
  end

  it "total_greater_than should find carts with totals greater than the amount given" do
    greater_than = Cart.create! :total => 100
    less_than = Cart.create! :total => 50
    Cart.total_greater_than(75).should include(greater_than)
    Cart.total_greater_than(75).should_not include(less_than)
  end
end
