class IncentivesController < ApplicationController
  def index
    @incentives = Incentive.find :all
  end

  def new
    @incentive = Incentive.new
  end

  def create
    @incentive = Incentive.new(params[:incentive])
    @incentive.criteria << IncentiveCriterium.new(params[:criterium])
    if @incentive.save
      redirect_to incentives_url
    else
      render :text => "uh oh!  couldn't create the incentive :("
    end
  end
end
