require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe IncentiveCampaignsController do
  integrate_views

  describe "GET /incentive_campaigns" do
    it "should be ok" do
      get :index
      response.should be_success
    end
  end
  
  describe "GET /incentive_campaigns/new" do
    it "should be ok" do
      get :new
      response.should be_success
    end
  end

  describe "POST /incentive_campaigns" do
    def do_post
      post :create, :incentive_id => "1", :action_id => "2"
    end

    it "should create a new incentive campaign" do
      lambda { do_post }.should change(IncentiveCampaign, :count).by(1)
    end
  end
end
