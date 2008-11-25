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

  describe "met_by?" do
    before(:each) do
      @proxy = mock('proxy', :find_by_id => nil)
      Cart.stub!(:my_finder).and_return @proxy

      @ic = IncentiveCriterium.new :model => "Cart", :finder => "my_finder", :params => [1,2]
      @cart = stub_model(Cart, :id => 123)
    end

    it "should execute the finder" do
      Cart.should_receive(:my_finder).with(1,2).and_return @proxy
      @ic.met_by? @cart
    end

    it "should try to find the record within the finder" do
      @proxy.should_receive(:find_by_id).with(123)
      @ic.met_by?(@cart)
    end

    it "should be true when the record is found" do
      @proxy.stub!(:find_by_id).and_return :found
      @ic.should be_met_by(@cart)
    end

    it "should be false when the record is not found" do
      @proxy.stub!(:find_by_id).and_return nil
      @ic.should_not be_met_by(@cart)
    end
  end
end
