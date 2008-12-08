require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe IncentivesController do
  integrate_views

  describe "GET /incentives" do
    it "should work" do
      get :index
      response.should be_success
    end
  end

  describe "GET /incentives/new" do
    it "should work" do
      get :new
      response.should be_success
    end
  end

  describe "POST /incentives" do
    def do_post
      post :create, :incentive => {:name => "new incentive"},
      :criterium => {:finder => 'total_greater_than', :model => 'Cart', :param => 200}
    end

    it "should create a new incentive" do
      lambda { do_post }.should change(Incentive, :count).by(1)
    end

    it "should create a new criterium for the incentive" do
      do_post
      i = Incentive.find :first
      i.should have(1).criteria
    end
  end
end
