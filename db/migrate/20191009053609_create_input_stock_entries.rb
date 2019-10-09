class CreateInputStockEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :input_stock_entries do |t|
      t.references :input_type, foreign_key: true
      t.references :input, foreign_key: true
      t.string :reason
      t.references :provider, foreign_key: true
      t.integer :quantity
      t.string :unit
      t.string :delivery_number
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
