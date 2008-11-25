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
      i = Incentive.new
      i.add_criteria Order, :total_greater_than, 50
      i.should have(1).criteria
    end
  end
end
