class CreateMylistStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :mylist_stocks do |t|
      t.integer :mylist_id
      t.integer :stock_id

      t.timestamps
    end
  end
end
