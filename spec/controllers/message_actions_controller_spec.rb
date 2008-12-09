require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MessageActionsController do

  def mock_message_action(stubs={})
    @mock_message_action ||= mock_model(MessageAction, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all message_actions as @message_actions" do
      MessageAction.should_receive(:find).with(:all).and_return([mock_message_action])
      get :index
      assigns[:message_actions].should == [mock_message_action]
    end

    describe "with mime type of xml" do
  
      it "should render all message_actions as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        MessageAction.should_receive(:find).with(:all).and_return(message_actions = mock("Array of MessageActions"))
        message_actions.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested message_action as @message_action" do
      MessageAction.should_receive(:find).with("37").and_return(mock_message_action)
      get :show, :id => "37"
      assigns[:message_action].should equal(mock_message_action)
    end
    
    describe "with mime type of xml" do

      it "should render the requested message_action as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        MessageAction.should_receive(:find).with("37").and_return(mock_message_action)
        mock_message_action.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new message_action as @message_action" do
      MessageAction.should_receive(:new).and_return(mock_message_action)
      get :new
      assigns[:message_action].should equal(mock_message_action)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested message_action as @message_action" do
      MessageAction.should_receive(:find).with("37").and_return(mock_message_action)
      get :edit, :id => "37"
      assigns[:message_action].should equal(mock_message_action)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created message_action as @message_action" do
        MessageAction.should_receive(:new).with({'these' => 'params'}).and_return(mock_message_action(:save => true))
        post :create, :message_action => {:these => 'params'}
        assigns(:message_action).should equal(mock_message_action)
      end

      it "should redirect to the created message_action" do
        MessageAction.stub!(:new).and_return(mock_message_action(:save => true))
        post :create, :message_action => {}
        response.should redirect_to(message_action_url(mock_message_action))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved message_action as @message_action" do
        MessageAction.stub!(:new).with({'these' => 'params'}).and_return(mock_message_action(:save => false))
        post :create, :message_action => {:these => 'params'}
        assigns(:message_action).should equal(mock_message_action)
      end

      it "should re-render the 'new' template" do
        MessageAction.stub!(:new).and_return(mock_message_action(:save => false))
        post :create, :message_action => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested message_action" do
        MessageAction.should_receive(:find).with("37").and_return(mock_message_action)
        mock_message_action.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :message_action => {:these => 'params'}
      end

      it "should expose the requested message_action as @message_action" do
        MessageAction.stub!(:find).and_return(mock_message_action(:update_attributes => true))
        put :update, :id => "1"
        assigns(:message_action).should equal(mock_message_action)
      end

      it "should redirect to the message_action" do
        MessageAction.stub!(:find).and_return(mock_message_action(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(message_action_url(mock_message_action))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested message_action" do
        MessageAction.should_receive(:find).with("37").and_return(mock_message_action)
        mock_message_action.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :message_action => {:these => 'params'}
      end

      it "should expose the message_action as @message_action" do
        MessageAction.stub!(:find).and_return(mock_message_action(:update_attributes => false))
        put :update, :id => "1"
        assigns(:message_action).should equal(mock_message_action)
      end

      it "should re-render the 'edit' template" do
        MessageAction.stub!(:find).and_return(mock_message_action(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested message_action" do
      MessageAction.should_receive(:find).with("37").and_return(mock_message_action)
      mock_message_action.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the message_actions list" do
      MessageAction.stub!(:find).and_return(mock_message_action(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(message_actions_url)
    end

  end

end
