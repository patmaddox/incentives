class CartsController < ApplicationController
  def index
    @carts = Cart.find :all
  end
  
  def show
    @cart = Cart.find params[:id]
  end
end
