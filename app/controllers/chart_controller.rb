class ChartController < ApplicationController
  def index
    @tradingviews = TradingView.all.limit(20)
    # @tradingviews = nil
    if params[:time_id].present?
      @time_id = params[:time_id].to_i
      @time = "D" if @time_id == 2
      @time = "W" if @time_id == 3
      @time = "M" if @time_id == 4
    else
      @time = "D"
    end
  end
end
