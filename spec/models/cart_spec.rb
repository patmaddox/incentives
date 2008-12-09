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

  describe "#add_to_cart" do
    it "should add the item to the cart" do
      c = Cart.create!
      i = Item.create!
      c.add_to_cart i
      c.reload.should have(1).items
    end
  end

  it "total_greater_than should find carts with totals greater than the amount given" do
    greater_than = Cart.create! :total => 100
    less_than = Cart.create! :total => 50
    Cart.total_greater_than(75).should include(greater_than)
    Cart.total_greater_than(75).should_not include(less_than)
  end

  describe "containing_item" do
    it "should find carts that contain the item" do
      item = Item.create!
      with_item = Cart.create!
      with_item.add_to_cart item
      without_item = Cart.create!
      Cart.containing_item(item).should include(with_item)
      Cart.containing_item(item).should_not include(without_item)
    end

    it "should be composable with itself" do
      item1 = Item.create!
      item2 = Item.create!
      with_both = Cart.create!
      with_both.add_to_cart item1
      with_both.add_to_cart item2
      with_one = Cart.create!
      with_one.add_to_cart item1
      Cart.containing_item(item1).containing_item(item2).should include(with_both)
      Cart.containing_item(item1).containing_item(item2).should_not include(with_one)
    end
  end

  it "should know its subtotal" do
    Cart.new(:total => 100).subtotal.should == 100
  end

  it "should know its total with no discount applied" do
    Cart.new(:total => 100).total.should == 100
  end

  describe "with a discount applied" do
    before(:each) do
      @cart = Cart.new(:total => 100)
      @cart.discount = PercentageDiscount.new(10)
    end
    
    it "should know its subtotal" do
      @cart.subtotal.should == 100
    end

    it "should have a discounted total" do
      @cart.total.should == 90
    end
  end
end
