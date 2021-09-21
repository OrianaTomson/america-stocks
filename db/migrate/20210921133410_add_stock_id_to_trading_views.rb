class AddStockIdToTradingViews < ActiveRecord::Migration[5.0]
  def change
    add_column :trading_views, :stock_id, :integer
  end
end
