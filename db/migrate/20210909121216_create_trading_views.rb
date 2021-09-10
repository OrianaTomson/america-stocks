class CreateTradingViews < ActiveRecord::Migration[5.0]
  def change
    create_table :trading_views do |t|
      t.string :code
      t.string :container_id

      t.timestamps
    end
  end
end
