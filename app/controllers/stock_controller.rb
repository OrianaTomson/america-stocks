class StockController < ApplicationController
  def index
    code = params[:search]

    if code.present?
      @stocks = Stock.where('code like ?', "%" + code + "%")
    else
      @stocks = Stock.all
    end

    @stocks = @stocks.page(params[:page]).per(20)
    @mylists = Mylist.all
  end

  def ajax_regist_mylist
    @mylist = Mylist.create({name: params[:list_name]})
    @stock_id = params[:stock_id]
  end

  def add_stock_mylist
    @mylist_id = params[:mylist_id]
    @stock_id = params[:stock_id]
    MylistStock.create({mylist_id: @mylist_id, stock_id: @stock_id})
    render json: {error_flg: false}
  end

  def ajax_disp_chart
    @stock = Stock.find_by(id: params[:stock_id])
    @trading_view = TradingView.find_by(stock_id: @stock.id)
    @symbol_code = @stock.code
    @container_id = @trading_view.container_id
    @time = "W"
    render template: "shared/_tradingview", layout: false
  end
end
