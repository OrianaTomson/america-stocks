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
    @mylist_name = params[:list_name]
    Mylist.create({name: @mylist_name})
  end

  def add_stock_mylist
    @mylist_id = params[:mylist_id]
    @stock_id = params[:stock_id]
    MylistStock.create({mylist_id: @mylist_id, stock_id: @stock_id})
    render json: {error_flg: false}
  end
end
