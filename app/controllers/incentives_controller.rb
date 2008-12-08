class IncentivesController < ApplicationController
  def index
    @incentives = Incentive.find :all
  end

  def new
    @incentive = Incentive.new
    @items = Item.find :all
  end

  def create
    @incentive = Incentive.new(params[:incentive])
    params[:criteria].each do |criterium|
      if criterium.delete(:enabled)
        @incentive.criteria.build criterium
      end
    end
    if @incentive.save
      redirect_to incentives_url
    else
      render :text => "uh oh!  couldn't create the incentive :("
    end
  end
end
