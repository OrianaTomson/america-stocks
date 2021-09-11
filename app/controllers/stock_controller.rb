class StockController < ApplicationController
  def index
    @stocks = Stock.all.limit(20)
  end
end
