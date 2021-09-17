class StockController < ApplicationController
  def index
    code = params[:search]

    if code.present?
      @stocks = Stock.where('code like ?', "%" + code + "%")
    else
      @stocks = Stock.all
    end

    @stocks = @stocks.page(params[:page]).per(20)
  end
end
