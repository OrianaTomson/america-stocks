class StockController < ApplicationController
  def index
    code = params[:search]

    if code.present?
      @stocks = Stock.where('code like ?', "%" + code + "%").limit(100)
    else
      @stocks = Stock.all.limit(100)
    end
  end
end
