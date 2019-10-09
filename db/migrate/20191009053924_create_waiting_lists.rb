class CreateWaitingLists < ActiveRecord::Migration[5.2]
  def change
    create_table :waiting_lists do |t|
      t.references :patient, foreign_key: true
      #t.references :analyse, foreign_key: true
      t.references :receipt, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
