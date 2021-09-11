class MyListController < ApplicationController
  def index
    @stocks = Stock.all
  end
end
