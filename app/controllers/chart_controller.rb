class ChartController < ApplicationController
  def index
    @tradingviews = TradingView.all.limit(8)
    @tradingviews = nil
  end
end
