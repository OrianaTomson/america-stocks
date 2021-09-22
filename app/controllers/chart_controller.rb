class ChartController < ApplicationController
  def index
    if params[:time_id].present?
      @time_id = params[:time_id].to_i
      @time = "D" if @time_id == 2
      @time = "W" if @time_id == 3
      @time = "M" if @time_id == 4
    else
      @time = "W"
    end

    @mylists = Mylist.all
  end

  def ajax_delete_from_mylist
    stock_id = params[:stock_id]
    mylist_id = params[:mylist_id]

    mylist = MylistStock.find_by(mylist_id: mylist_id, stock_id: stock_id)
    mylist.destroy if mylist.present?
  end
end
