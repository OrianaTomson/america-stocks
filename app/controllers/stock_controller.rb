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
end
