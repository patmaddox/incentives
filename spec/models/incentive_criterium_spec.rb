require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe IncentiveCriterium do
  before(:each) do
    @valid_attributes = {
    }
  end

  it "should create a new instance given valid attributes" do
    IncentiveCriterium.create!(@valid_attributes)
  end

  describe "setting params" do
    it "should return the params after saving" do
      ic = IncentiveCriterium.create! :params => [1,2]
      IncentiveCriterium.find(ic.id).params.should == [1,2]
    end
  end
end
