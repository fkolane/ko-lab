class CreateInputs < ActiveRecord::Migration[5.2]
  def change
    create_table :inputs do |t|
      t.references :input_type, foreign_key: true
      t.string :name
      #t.text :description
      #t.string :dosage
      #t.text :presentation
      #t.text :pharmaceutical_form
      #t.text :administration_method
      #t.float :unit_price , default: 0.0
      #t.float :vat , default: 0.0
      #t.float :total_price
      t.date :manufacture_date
      t.date :expiration_date
      t.string :batch_number
      t.string :cip
      t.string :manufacturer
      t.integer :alert_level
      t.string :shelf_number
      t.integer :current_stock
      t.string :status
      t.references :provider, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
