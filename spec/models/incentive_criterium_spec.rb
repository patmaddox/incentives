require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe IncentiveCriterium do
  before(:each) do
    @valid_attributes = {
    }
  end

  it "should create a new instance given valid attributes" do
    IncentiveCriterium.create!(@valid_attributes)
  end

  describe "met_by?" do
    before(:each) do
      @proxy = mock('proxy', :find_by_id => nil)
      Cart.stub!(:my_finder).and_return @proxy

      incentive = Incentive.new :model => Cart
      @ic = IncentiveCriterium.new :incentive => incentive, :finder => "my_finder", :param => 1
      @cart = stub_model(Cart, :id => 123)
    end

    it "should execute the finder" do
      Cart.should_receive(:my_finder).with(1).and_return @proxy
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

  describe "composite criteria #met_by?" do
    before(:each) do
      @proxy = mock('proxy', :find_by_id => nil)
      incentive = Incentive.new :model => Cart
      @ic1 = IncentiveCriterium.new :incentive => incentive
      @ic1.stub!(:executable_finder).and_return @proxy
      @ic2 = IncentiveCriterium.new :incentive => incentive
      @ic2.stub!(:executable_finder).and_return @proxy
      @ic3 = IncentiveCriterium.new :incentive => incentive
      @ic3.stub!(:executable_finder).and_return @proxy
      @composite = @ic1 + @ic2 + @ic3
      @cart = mock_model(Cart, :id => 123)
    end

    it "should call the finder for each criterium" do
      @ic1.should_receive(:executable_finder).and_return(@proxy)
      @ic2.should_receive(:executable_finder).and_return(@proxy)
      @ic3.should_receive(:executable_finder).and_return(@proxy)
      @composite.met_by?(@cart)
    end

    it "should be false when it doesn't find anything" do
      @proxy.should_receive(:find_by_id).with(@cart.id).and_return nil
      @composite.should_not be_met_by(@cart)
    end

    it "should be true when it finds the cart" do
      @proxy.should_receive(:find_by_id).with(@cart.id).and_return true
      @composite.should be_met_by(@cart)
    end
  end
end
