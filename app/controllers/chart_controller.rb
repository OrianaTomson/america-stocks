class ChartController < ApplicationController
  def index
    @tradingviews = TradingView.all
  end
end
