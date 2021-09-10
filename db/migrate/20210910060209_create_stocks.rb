class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.string :code
      t.string :client_name
      t.string :explain
      t.string :market

      t.timestamps
    end
  end
end
