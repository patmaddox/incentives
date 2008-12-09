require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MessageAction do
  it "should fill the flash with its message" do
    flash = {}
    action = MessageAction.create! :message => "here we go!", :flash => flash
    action.apply
    flash[:notice].should == "here we go!"
  end

  it "should not blow up when applied with no flash given" do
    MessageAction.new(:message => "no exceptions please").apply
  end
end
