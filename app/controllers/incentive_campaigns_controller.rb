class IncentiveCampaignsController < ApplicationController
  def index
    @incentive_campaigns = IncentiveCampaign.find :all
  end
  
  def new
    @incentive_campaign = IncentiveCampaign.new
    @incentives = Incentive.find :all
    @actions = MessageAction.find :all
  end

  def create
    @incentive_campaign = IncentiveCampaign.new params[:incentive_campaign]
    if @incentive_campaign.save
      redirect_to incentive_campaigns_url
    else
      render :text => "uh oh!  there was a problem"
    end
  end
end
