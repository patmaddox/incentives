require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe IncentiveCampaign do
  before(:each) do
    @valid_attributes = {
      :incentive_id => "1",
      :action_id => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    IncentiveCampaign.create!(@valid_attributes)
  end
end
