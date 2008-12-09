class MessageActionsController < ApplicationController
  # GET /message_actions
  # GET /message_actions.xml
  def index
    @message_actions = MessageAction.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @message_actions }
    end
  end

  # GET /message_actions/1
  # GET /message_actions/1.xml
  def show
    @message_action = MessageAction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @message_action }
    end
  end

  # GET /message_actions/new
  # GET /message_actions/new.xml
  def new
    @message_action = MessageAction.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @message_action }
    end
  end

  # GET /message_actions/1/edit
  def edit
    @message_action = MessageAction.find(params[:id])
  end

  # POST /message_actions
  # POST /message_actions.xml
  def create
    @message_action = MessageAction.new(params[:message_action])

    respond_to do |format|
      if @message_action.save
        flash[:notice] = 'MessageAction was successfully created.'
        format.html { redirect_to(@message_action) }
        format.xml  { render :xml => @message_action, :status => :created, :location => @message_action }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @message_action.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /message_actions/1
  # PUT /message_actions/1.xml
  def update
    @message_action = MessageAction.find(params[:id])

    respond_to do |format|
      if @message_action.update_attributes(params[:message_action])
        flash[:notice] = 'MessageAction was successfully updated.'
        format.html { redirect_to(@message_action) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @message_action.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /message_actions/1
  # DELETE /message_actions/1.xml
  def destroy
    @message_action = MessageAction.find(params[:id])
    @message_action.destroy

    respond_to do |format|
      format.html { redirect_to(message_actions_url) }
      format.xml  { head :ok }
    end
  end
end
