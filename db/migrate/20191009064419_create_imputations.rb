class CreateImputations < ActiveRecord::Migration[5.2]
  def change
    create_table :imputations do |t|
      t.references :arrival_mail, foreign_key: true
      t.references :service, foreign_key: true
      t.references :agent, index: true
      t.text :reason
      t.text :opinion

      t.timestamps
    end
  end
end
