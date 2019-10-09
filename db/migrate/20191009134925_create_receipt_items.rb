class CreateReceiptItems < ActiveRecord::Migration[5.2]
  def change
    create_table :receipt_items do |t|
      t.references :receipt, foreign_key: true
      t.references :analysis, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end
