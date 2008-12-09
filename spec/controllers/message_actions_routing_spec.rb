require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MessageActionsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "message_actions", :action => "index").should == "/message_actions"
    end
  
    it "should map #new" do
      route_for(:controller => "message_actions", :action => "new").should == "/message_actions/new"
    end
  
    it "should map #show" do
      route_for(:controller => "message_actions", :action => "show", :id => 1).should == "/message_actions/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "message_actions", :action => "edit", :id => 1).should == "/message_actions/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "message_actions", :action => "update", :id => 1).should == "/message_actions/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "message_actions", :action => "destroy", :id => 1).should == "/message_actions/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/message_actions").should == {:controller => "message_actions", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/message_actions/new").should == {:controller => "message_actions", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/message_actions").should == {:controller => "message_actions", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/message_actions/1").should == {:controller => "message_actions", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/message_actions/1/edit").should == {:controller => "message_actions", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/message_actions/1").should == {:controller => "message_actions", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/message_actions/1").should == {:controller => "message_actions", :action => "destroy", :id => "1"}
    end
  end
end
