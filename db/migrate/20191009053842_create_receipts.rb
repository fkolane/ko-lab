class CreateReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts do |t|
      t.references :patient, foreign_key: true
      #t.references :analysis, foreign_key: true
      #t.float :amount, default: 0.0
      t.float :insurance_amount, default: 0.0
      t.float :total_amount, default: 0.0
      #t.text :description
      t.string :status

      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
